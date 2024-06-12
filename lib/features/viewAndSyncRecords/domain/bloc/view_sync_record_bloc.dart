import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';


class ViewSyncRecordBloc extends Bloc<ViewSyncRecordEvent, ViewSyncRecordState> {
  ViewSyncRecordBloc() : super(ViewSyncRecordInitialState()) {
    on<ViewSyncRecordLoadPageEvent>(_pageLoad);
    on<ViewSyncRecordLoadUpdateLocalDataEvent>(_updateLocalData);
    on<ViewSyncRecordDeleteLocalDataEvent>(_deleteLocalData);
    on<SyncRecordListServerDataEvent>(_sendListData);
    on<SyncRecordSingleServerDataEvent>(_sendSingleData);
  }

  bool isSaveServerLoader = false;
  bool isDeleteLoader = false;

  List<SaveRegistrationFormModel> listOfRegistrationForm = [];
  Box<SaveRegistrationFormModel>? boxOfRegistrationForm;

  _pageLoad(ViewSyncRecordLoadPageEvent event, emit) async {
    emit(ViewSyncRecordPageLoadState());
    isSaveServerLoader = false;
    isDeleteLoader = false;
    listOfRegistrationForm = [];
    boxOfRegistrationForm = await HiveDataBase.registrationFormBox;
    listOfRegistrationForm = await boxOfRegistrationForm!.values.toList();
    _eventCompleted(emit);
  }


  _updateLocalData(ViewSyncRecordLoadUpdateLocalDataEvent event, emit) async {
    /* await CustomRegistrationFormHelper.addCustomerFormInLocalDatabase(context: event.context, saveCusRegData: saveCusRegData);
    _eventCompleted(emit);*/
  }

  _deleteLocalData(ViewSyncRecordDeleteLocalDataEvent event, emit) {
    return showDialog(
        context: event.context,
        builder: (BuildContext context) => MessageBoxTwoButtonPopWidget(
          message: "Do you really want to delete?",
          okButtonText: "Yes",
          onPressed: () async {
            if (HiveDataBase.registrationFormBox!.values.isNotEmpty) {
              Navigator.pop(event.context);
              Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecord);
              log("Data Length P ============== ${HiveDataBase.registrationFormBox!.values.length}");
              return await boxOfRegistrationForm!.deleteAt(event.index);
            }
            _eventCompleted(emit);
          },
        ));
  }

  _sendListData(SyncRecordListServerDataEvent event, emit) async {
    try{
      isSaveServerLoader = true;
      _eventCompleted(emit);
      if(listOfRegistrationForm.isNotEmpty){
        for (int i = 0; i < listOfRegistrationForm.length; i++) {
          var res = await ViewSyncRecordHelper.sendData(context: event.context, custRegSyncData: listOfRegistrationForm[i]);
          if (res != null) {
            isSaveServerLoader = false;
            _eventCompleted(emit);
            await Utils.successSnackBar(msg: res.message![0].message!, context: event.context);
            await listOfRegistrationForm.removeAt(i);
            _eventCompleted(emit);
          }
        }
    //    Navigator.pushReplacementNamed(event.context, RoutesName.viewSyncRecord);
      }
    } catch(e){
      isSaveServerLoader = false;
      log("_saveServerData-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: event.context);
    }
  }

  _sendSingleData(SyncRecordSingleServerDataEvent event, emit) async {
    try{
      isSaveServerLoader = true;
      _eventCompleted(emit);
      if(listOfRegistrationForm.isNotEmpty){
        var res = await ViewSyncRecordHelper.sendData(context: event.context, custRegSyncData: listOfRegistrationForm[event.index]);
        if (res != null) {
          isSaveServerLoader = false;
          _eventCompleted(emit);
          log("Data Length P ============== ${HiveDataBase.registrationFormBox!.values.length}");
          await Utils.successSnackBar(msg: res.message![0].message!, context: event.context);
         // await boxOfRegistrationForm!.deleteAt(event.index);
          await listOfRegistrationForm.removeAt(event.index);
          Navigator.pushReplacementNamed(event.context, RoutesName.viewSyncRecord);
          _eventCompleted(emit);
        }
      }
    } catch(e){
      isSaveServerLoader = false;
      log("_sendSingleData-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: event.context);
    }
  }


  Future<void> clearCache() async {
    Directory path = Directory("/data/user/0/com.unistal.igl_dma_app/cache/");
    if(await path.exists()) {
      List<FileSystemEntity> files = path.listSync();
      for(FileSystemEntity f in files) {
        if(f is File) {
          await f.delete();
        }
      }
    }
    Directory path2 = Directory("/data/user/0/com.unistal.igl_dma_app/cache/file_picker/");
    if(await path2.exists()) {
      path2.deleteSync(recursive: true);
    }
  }

  _eventCompleted(Emitter<ViewSyncRecordState> emit) {
    emit(ViewSyncRecordDataState(
      isSaveServerLoader: isSaveServerLoader,
      isDeleteLoader: isDeleteLoader,
      listOfRegistrationForm: listOfRegistrationForm,
      boxOfRegistrationForm: boxOfRegistrationForm,
    ));
  }

}
