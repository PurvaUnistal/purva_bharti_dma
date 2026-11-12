import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/RegistrationForm/helper/registration_sync_service.dart';

class ViewSyncRecordBloc
    extends Bloc<ViewSyncRecordEvent, ViewSyncRecordState> {
  ViewSyncRecordBloc() : super(ViewSyncRecordInitialState()) {
    on<ViewSyncRecordLoadPageEvent>(_pageLoad);
    on<DeleteLocalDataEvent>(_deleteLocalData);
    on<SyncRecordListServerDataEvent>(_sendListData);
    on<SyncRecordSingleServerDataEvent>(_sendSingleData);
    on<ViewSyncRecordRefreshEvent>(_refresh);
    _listenForChanges();
  }

  bool isGrpServerLoader = false;
  bool isDeleteLoader = false;
  bool isConnective = false;

  List<SaveRegistrationFormModel> listOfRegistrationForm = [];
  Box<SaveRegistrationFormModel>? boxOfRegistrationForm;

  /// Hive keys in the same order as listOfRegistrationForm, so the index the
  /// UI passes always maps to the record the user actually tapped.
  List<dynamic> _keys = [];

  StreamSubscription? _boxSub;
  StreamSubscription<bool>? _syncSub;

  void _listenForChanges() {
    // Refresh whenever the auto-sync (or anything else) changes the box.
    _boxSub ??= HiveDataBase.registrationFormBox?.watch().listen((_) {
      if (!isClosed) add(ViewSyncRecordRefreshEvent());
    });
    _syncSub ??= RegistrationSyncService.instance.syncState.listen((syncing) {
      isGrpServerLoader = syncing;
      if (!isClosed) add(ViewSyncRecordRefreshEvent());
    });
  }

  void _loadFromBox() {
    final box = HiveDataBase.registrationFormBox;
    boxOfRegistrationForm = box;
    final keys = <dynamic>[];
    final values = <SaveRegistrationFormModel>[];
    if (box != null) {
      for (final key in box.keys) {
        final value = box.get(key);
        if (value != null) {
          keys.add(key);
          values.add(value);
        }
      }
    }
    _keys = keys;
    listOfRegistrationForm = values;
  }

  _pageLoad(ViewSyncRecordLoadPageEvent event, emit) async {
    emit(ViewSyncRecordPageLoadState());
    _listenForChanges(); // in case the box was not open at construction
    isDeleteLoader = false;
    isGrpServerLoader = RegistrationSyncService.instance.isSyncing;
    // The user is back on the list, so nothing is being edited any more.
    RegistrationSyncService.instance.pausedRequestId = null;

    isConnective =
    await ConnectivityHelper.checkInternetConnect(context: event.context);
    _loadFromBox();
    _eventCompleted(emit);

    // Opening the list with internet available also flushes the queue.
    if (isConnective && listOfRegistrationForm.isNotEmpty) {
      unawaited(RegistrationSyncService.instance.syncPending());
    }
  }

  _refresh(ViewSyncRecordRefreshEvent event, emit) {
    _loadFromBox();
    _eventCompleted(emit);
  }

  Future<void> _deleteLocalData(DeleteLocalDataEvent event, emit) async {
    if (event.index < 0 || event.index >= _keys.length) return;
    final key = _keys[event.index]; // capture before anything can shift

    final confirmed = await showDialog<bool>(
      context: event.context,
      builder: (BuildContext dialogContext) => MessageBoxTwoButtonPopWidget(
        message: "Do you really want to delete?",
        okButtonText: "Yes",
        onPressed: () => Navigator.pop(dialogContext, true),
      ),
    );
    if (confirmed != true) return;

    await HiveDataBase.registrationFormBox?.delete(key);
    _loadFromBox();
    _eventCompleted(emit);
  }

  _sendListData(SyncRecordListServerDataEvent event, emit) async {
    if (listOfRegistrationForm.isEmpty) {
      Utils.successSnackBar(msg: "The list is empty.", context: event.context);
      return;
    }
    if (!await ConnectivityHelper.checkInternetConnect(context: event.context)) {
      return;
    }
    if (RegistrationSyncService.instance.isSyncing) {
      Utils.errorSnackBar(
        msg: "Sync already in progress, please wait.",
        context: event.context,
      );
      return;
    }

    try {
      // Shows its own "x record(s) synced" message; the loader is driven
      // by the syncState stream.
      await RegistrationSyncService.instance.syncPending();
      _loadFromBox();
      if (listOfRegistrationForm.isNotEmpty && event.context.mounted) {
        Utils.errorSnackBar(
          msg: "${listOfRegistrationForm.length} record(s) could not be sent.",
          context: event.context,
        );
      }
    } catch (e) {
      log("Error while sending group data-->${e.toString()}");
      if (event.context.mounted) {
        Utils.errorSnackBar(msg: e.toString(), context: event.context);
      }
    } finally {
      isGrpServerLoader = false;
      _eventCompleted(emit);
    }
  }

  _sendSingleData(SyncRecordSingleServerDataEvent event, emit) async {
    if (event.index < 0 || event.index >= _keys.length) return;
    final key = _keys[event.index];
    final record = listOfRegistrationForm[event.index];

    if (!await ConnectivityHelper.checkInternetConnect(context: event.context)) {
      return;
    }

    try {
      record.isSingleServerLoader = true;
      _eventCompleted(emit);

      final res = await RegistrationSyncService.instance
          .sendOne(key, context: event.context);

      if (res != null) {
        if (event.context.mounted) {
          Utils.successSnackBar(
            msg: res.message?.first.message ?? "Record sent successfully",
            context: event.context,
          );
        }
      } else {
        throw Exception("Unable to send data");
      }
    } catch (e) {
      log("Error while sending single data-->${e.toString()}");
      if (event.context.mounted) {
        Utils.errorSnackBar(msg: e.toString(), context: event.context);
      }
    } finally {
      record.isSingleServerLoader = false;
      _loadFromBox();
      _eventCompleted(emit);
    }
  }

  Future<void> clearCache() async {
    Directory path = Directory("/data/user/0/com.unistal.igl_dma_app/cache/");
    if (await path.exists()) {
      List<FileSystemEntity> files = path.listSync();
      for (FileSystemEntity f in files) {
        if (f is File) {
          await f.delete();
        }
      }
    }
    Directory path2 =
    Directory("/data/user/0/com.unistal.igl_dma_app/cache/file_picker/");
    if (await path2.exists()) {
      path2.deleteSync(recursive: true);
    }
  }

  _eventCompleted(Emitter<ViewSyncRecordState> emit) {
    emit(ViewSyncRecordPageLoadState());
    emit(ViewSyncRecordDataState(
      isGrpServerLoader: isGrpServerLoader,
      isConnective: isConnective,
      isDeleteLoader: isDeleteLoader,
      listOfRegistrationForm: listOfRegistrationForm,
      boxOfRegistrationForm: boxOfRegistrationForm,
    ));
  }

  @override
  Future<void> close() {
    _boxSub?.cancel();
    _syncSub?.cancel();
    return super.close();
  }
}