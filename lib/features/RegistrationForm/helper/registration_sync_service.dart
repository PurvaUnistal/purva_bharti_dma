import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_navigator.dart';
import 'package:pbg_app/features/RegistrationForm/helper/registration_form_helper.dart';

/// Uploads registration records saved offline (Hive) automatically as soon
/// as the internet comes back, from ANY screen.
///
/// Triggers:
///   1. Network change (Wi-Fi / mobile data on)
///   2. App back in foreground (Root calls trigger())
///   3. Internet back on the Dashboard (InternetBloc -> trigger())
///   4. Periodic check every [_retryInterval]
///
/// API used by ViewSyncRecordBloc:
///   isSyncing, syncState, syncPending(), sendOne(key, context:),
///   pausedRequestId
class RegistrationSyncService {
  RegistrationSyncService._();
  static final RegistrationSyncService instance = RegistrationSyncService._();

  static const Duration _retryInterval = Duration(minutes: 1);
  static const Duration _debounce = Duration(seconds: 3);

  /// Record currently open in the edit form: never auto-upload it.
  String? pausedRequestId;

  // ---------------------------------------------------------------------------
  // State streams
  // ---------------------------------------------------------------------------

  bool get isSyncing => _isSyncing;
  bool _isSyncing = false;

  /// true when an upload run starts, false when it ends (drives the loader).
  Stream<bool> get syncState => _syncStateController.stream;
  final StreamController<bool> _syncStateController =
  StreamController<bool>.broadcast();

  /// Number of records uploaded in a run (for screens that want to react).
  Stream<int> get onRecordsSynced => _syncedController.stream;
  final StreamController<int> _syncedController =
  StreamController<int>.broadcast();

  void _setSyncing(bool value) {
    if (_isSyncing == value) return;
    _isSyncing = value;
    _syncStateController.add(value);
  }

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  StreamSubscription<dynamic>? _connectivitySub;
  Timer? _retryTimer;
  Timer? _debounceTimer;
  bool _started = false;

  /// Safe to call many times (Root and Dashboard both call it).
  void start() {
    if (_started) return;
    _started = true;

    // Value type differs between connectivity_plus versions; only the event
    // itself matters.
    _connectivitySub =
        Connectivity().onConnectivityChanged.listen((_) => trigger());
    _retryTimer = Timer.periodic(_retryInterval, (_) => trigger());
    trigger();
  }

  void dispose() {
    _connectivitySub?.cancel();
    _retryTimer?.cancel();
    _debounceTimer?.cancel();
    _connectivitySub = null;
    _retryTimer = null;
    _debounceTimer = null;
    _started = false;
  }

  /// Schedules a background sync; quick repeated triggers become one run.
  void trigger() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounce, () => syncPending());
  }

  // ---------------------------------------------------------------------------
  // Checks
  // ---------------------------------------------------------------------------

  /// Real internet check (DNS lookup), not just "Wi-Fi is on".
  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  bool get _isLoggedIn {
    try {
      return AppConfig.instanceInit()?.loginData.user?.id != null;
    } catch (_) {
      return false;
    }
  }

  static bool _isNetworkError(Object e) {
    if (e is SocketException || e is TimeoutException) return true;
    if (e is DioException) {
      return e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout;
    }
    return false;
  }

  // ---------------------------------------------------------------------------
  // Upload all queued records
  // ---------------------------------------------------------------------------

  /// Uploads every queued record. Returns how many were uploaded.
  /// Only one run at a time; a second call while syncing returns 0.
  Future<int> syncPending() async {
    if (_isSyncing) return 0;

    final box = HiveDataBase.registrationFormBox;
    if (box == null) {
      log("Auto-sync skipped: registration Hive box is not open yet");
      return 0;
    }
    if (box.isEmpty) return 0;
    if (!_isLoggedIn) {
      log("Auto-sync skipped: user not logged in yet");
      return 0;
    }
    if (AppNavigator.navigatorKey.currentContext == null) {
      log("Auto-sync skipped: navigator not ready");
      return 0;
    }
    if (!await hasInternet()) {
      log("Auto-sync skipped: no internet");
      return 0;
    }

    log("Auto-sync: uploading ${box.length} queued record(s)");
    _setSyncing(true);
    int uploaded = 0;

    try {
      // Snapshot: the box changes as synced records are deleted.
      for (final key in box.keys.toList()) {
        final record = box.get(key);
        if (record == null) continue;
        if (_isPaused(record)) continue; // open in the edit form

        try {
          final res = await _send(record);
          if (res != null) {
            await _removeIfNotPaused(key, record);
            uploaded++;
          }
          // res == null -> server rejected it; keep it so the user can fix it.
        } catch (e) {
          if (_isNetworkError(e)) {
            log("Auto-sync: internet dropped, will retry later --> $e");
            break;
          }
          log("Auto-sync: record ${record.clientRequestId} failed --> $e");
        }
      }
    } finally {
      _setSyncing(false);
    }

    if (uploaded > 0) {
      _syncedController.add(uploaded);
      final ctx = AppNavigator.navigatorKey.currentContext;
      if (ctx != null) {
        Utils.successSnackBar(
          msg: uploaded == 1
              ? "1 offline record synced successfully"
              : "$uploaded offline records synced successfully",
          context: ctx,
        );
      }
    }
    return uploaded;
  }

  /// Backward-compatible name.
  Future<int> syncNow() => syncPending();

  // ---------------------------------------------------------------------------
  // Upload one record (sync icon on a single card)
  // ---------------------------------------------------------------------------

  /// Sends the record stored under [key]. Returns the server response, or
  /// null if the server rejected it. Throws on network errors.
  Future<dynamic> sendOne(dynamic key, {required BuildContext context}) async {
    // Never send the same record twice at once.
    if (_isSyncing) {
      throw Exception("Sync already in progress, please wait.");
    }

    final box = HiveDataBase.registrationFormBox;
    final record = box?.get(key);
    if (record == null) {
      throw Exception("Record not found. It may already be synced.");
    }

    _setSyncing(true);
    try {
      final res = await _send(record, context: context);
      if (res != null) {
        await _removeIfNotPaused(key, record);
        _syncedController.add(1);
      }
      return res;
    } finally {
      _setSyncing(false);
    }
  }

  // ---------------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------------

  bool _isPaused(SaveRegistrationFormModel record) =>
      record.clientRequestId != null &&
          record.clientRequestId == pausedRequestId;

  Future<dynamic> _send(
      SaveRegistrationFormModel record, {
        BuildContext? context,
      }) {
    final ctx = context ?? AppNavigator.navigatorKey.currentContext;
    if (ctx == null) throw Exception("App not ready");
    return ViewSyncRecordHelper.sendData(
      context: ctx,
      custRegSyncData: record,
    );
  }

  /// Deletes the uploaded record unless the user opened it for editing
  /// while it was being sent.
  Future<void> _removeIfNotPaused(
      dynamic key,
      SaveRegistrationFormModel record,
      ) async {
    if (_isPaused(record)) return;
    final box = HiveDataBase.registrationFormBox;
    if (box != null && box.containsKey(key)) {
      await box.delete(key);
    } else {
      await RegistrationFormHelper.deleteLocalRecord(record.clientRequestId);
    }
  }
}