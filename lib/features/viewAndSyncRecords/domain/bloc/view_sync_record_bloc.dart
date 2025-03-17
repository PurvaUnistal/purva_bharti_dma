import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ViewSyncRecordBloc
    extends Bloc<ViewSyncRecordEvent, ViewSyncRecordState> {
  ViewSyncRecordBloc() : super(ViewSyncRecordInitialState()) {
    on<ViewSyncRecordLoadPageEvent>(_pageLoad);
    on<ViewSyncRecordLoadUpdateLocalDataEvent>(_updateLocalData);
    on<DeleteLocalDataEvent>(_deleteLocalData);
    on<SyncRecordListServerDataEvent>(_sendListData);
    on<SyncRecordSingleServerDataEvent>(_sendSingleData);
  }

  bool isGrpServerLoader = false;
  bool isDeleteLoader = false;
  bool isConnective = false;

  List<SaveRegistrationFormModel> listOfRegistrationForm = [];
  Box<SaveRegistrationFormModel>? boxOfRegistrationForm;

  _pageLoad(ViewSyncRecordLoadPageEvent event, emit) async {
    emit(ViewSyncRecordPageLoadState());
    isGrpServerLoader = false;
    isDeleteLoader = false;
    listOfRegistrationForm = [];
    isConnective =
        await ConnectivityHelper.allConnectivityCheck(context: event.context);
    listOfRegistrationForm =
        await HiveDataBase.registrationFormBox!.values.toList();
    _eventCompleted(emit);
  }

  _updateLocalData(ViewSyncRecordLoadUpdateLocalDataEvent event, emit) async {}

  _deleteLocalData(DeleteLocalDataEvent event, emit) {
    return showDialog(
        context: event.context,
        builder: (BuildContext context) => MessageBoxTwoButtonPopWidget(
              message: "Do you really want to delete?",
              okButtonText: "Yes",
              onPressed: () async {
                if (HiveDataBase.registrationFormBox!.values.isNotEmpty) {
                  Navigator.pop(event.context);
                  Navigator.pushReplacementNamed(
                      context, RoutesName.viewSyncRecord);
                  log("Data Length P ============== ${HiveDataBase.registrationFormBox!.values.length}");
                  return HiveDataBase.registrationFormBox
                      ?.deleteAt(event.index);
                }
                _eventCompleted(emit);
              },
            ));
  }

  _sendListData(SyncRecordListServerDataEvent event, emit) async {
    try {
      if (listOfRegistrationForm.isNotEmpty) {
        isGrpServerLoader = true;
        _eventCompleted(emit);
        bool hasChanges = false;
        for (int i = listOfRegistrationForm.length - 1; i >= 0; i--) {
          var res = await ViewSyncRecordHelper.sendData(
              context: event.context, custRegSyncData: listOfRegistrationForm[i]);

          if (res != null) {
            hasChanges = true;
            await HiveDataBase.registrationFormBox!.deleteAt(i);
          }
        }
        if (hasChanges) {
          listOfRegistrationForm =
              await HiveDataBase.registrationFormBox!.values.toList();
          isGrpServerLoader = false;
          _eventCompleted(emit);
          await Utils.successSnackBar(
              msg: "The group list successfully send.", context: event.context);
        }
      } else {
        await Utils.successSnackBar(
            msg: "The list is empty.", context: event.context);
      }
    } catch (e) {
      log("Error while sending group data-->${e.toString()}");
      isGrpServerLoader = false;
      _eventCompleted(emit);
      Utils.errorSnackBar(msg: e.toString(), context: event.context);
    }
  }

  _sendSingleData(SyncRecordSingleServerDataEvent event, emit) async {
    SaveRegistrationFormModel saveRegistrationFormModel = listOfRegistrationForm[event.index];
    try {
      saveRegistrationFormModel.isSingleServerLoader = true;
      _eventCompleted(emit);
      var res = await ViewSyncRecordHelper.sendData(
          context: event.context,
          custRegSyncData: saveRegistrationFormModel);

      if(res != null) {
        await Utils.successSnackBar(msg: res.message![0].message!, context: event.context);
        await HiveDataBase.registrationFormBox!.deleteAt(event.index);
        listOfRegistrationForm = await HiveDataBase.registrationFormBox!.values.toList();
      } else {
        throw Exception("Unable to send data");
      }

    } catch(e) {
      log("Error while sending single data-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: event.context);
    } finally {
      saveRegistrationFormModel.isSingleServerLoader = false;
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
}
