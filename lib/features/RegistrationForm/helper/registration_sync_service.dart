import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_navigator.dart';

/// Background sync uses the app's existing navigator key (set on MaterialApp
/// in Root) to get a BuildContext for sendData and snackbars.
GlobalKey<NavigatorState> get navigatorKey => AppNavigator.navigatorKey;

class RegistrationSyncService with WidgetsBindingObserver {
  RegistrationSyncService._();
  static final RegistrationSyncService instance = RegistrationSyncService._();

  StreamSubscription<List<ConnectivityResult>>? _connSub;
  Timer? _debounce;
  bool _isSyncing = false;
  bool _started = false;

  bool get isSyncing => _isSyncing;

  /// clientRequestId of the queued record currently open in the edit form.
  /// Auto-sync skips it so it is not sent while the user is changing it.
  String? pausedRequestId;

  /// Sends one queued record (manual sync button). Uses the same lock as
  /// syncPending so the same record is never sent twice at once.
  /// Returns the server response, or null if the server rejected it.
  Future<dynamic> sendOne(dynamic key, {required BuildContext context}) async {
    if (_isSyncing) {
      throw Exception("Sync already in progress, please wait.");
    }
    final box = await HiveDataBase.registrationFormBox;
    final record = box?.get(key);
    if (box == null || record == null) return null;

    _isSyncing = true;
    try {
      final res = await ViewSyncRecordHelper.sendData(
        context: context,
        custRegSyncData: record,
      );
      if (res != null) await box.delete(key);
      return res;
    } finally {
      _isSyncing = false;
    }
  }

  /// Emits true when a sync starts and false when it ends (for loaders).
  final StreamController<bool> _syncStateController =
  StreamController<bool>.broadcast();
  Stream<bool> get syncState => _syncStateController.stream;

  /// Call once after Hive is initialised (in main.dart).
  void start() {
    if (_started) return;
    _started = true;
    WidgetsBinding.instance.addObserver(this);

    // connectivity_plus >= 6.0 emits List<ConnectivityResult>.
    _connSub = Connectivity().onConnectivityChanged.listen((results) {
      final connected = results.any((r) => r != ConnectivityResult.none);
      if (connected) {
        // Network often flaps when it comes back; wait a moment before syncing.
        _debounce?.cancel();
        _debounce = Timer(const Duration(seconds: 3), () => syncPending());
      }
    });

    // Sync anything left over from a previous session.
    syncPending();
  }

  void dispose() {
    _debounce?.cancel();
    _connSub?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _started = false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) syncPending();
  }

  /// Wi-Fi/mobile "connected" does not always mean the internet works,
  /// so do a real DNS lookup.
  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 5));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  /// Sends every queued record to the server and removes the ones that
  /// succeed. Returns how many were sent. Safe to call from anywhere:
  /// a second call while a sync is running is ignored.
  Future<int> syncPending({bool showMessage = true}) async {
    if (_isSyncing) return 0;

    final box = await HiveDataBase.registrationFormBox;
    if (box == null || box.isEmpty) return 0;
    if (!await hasInternet()) return 0;

    _isSyncing = true;
    _syncStateController.add(true);
    int sent = 0;

    try {
      // Use keys, not indexes: deleting while looping shifts indexes.
      final keys = box.keys.toList();
      for (final key in keys) {
        final record = box.get(key);
        if (record == null) continue;
        if (pausedRequestId != null &&
            record.clientRequestId == pausedRequestId) {
          continue; // being edited right now
        }

        final ctx = navigatorKey.currentContext;
        if (ctx == null) break;

        try {
          final res = await ViewSyncRecordHelper.sendData(
            context: ctx,
            custRegSyncData: record,
          );
          if (res != null) {
            await box.delete(key);
            sent++;
          }
        } catch (e) {
          // Leave the record in Hive; it will retry on the next trigger.
          log("Auto sync failed for key $key --> $e");
          if (!await hasInternet()) break; // connection dropped mid-sync
        }
      }
    } finally {
      _isSyncing = false;
      _syncStateController.add(false);
    }

    final ctx = navigatorKey.currentContext;
    if (sent > 0 && showMessage && ctx != null && ctx.mounted) {
      Utils.successSnackBar(
        msg: "$sent pending record(s) synced to server.",
        context: ctx,
      );
    }
    return sent;
  }
}