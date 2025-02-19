import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';


class ViewSyncRecordBloc extends Bloc<ViewSyncRecordEvent, ViewSyncRecordState> {
  ViewSyncRecordBloc() : super(ViewSyncRecordInitialState()) {
    on<ViewSyncRecordLoadPageEvent>(_pageLoad);
    on<ViewSyncRecordLoadUpdateLocalDataEvent>(_updateLocalData);
    on<DeleteLocalDataEvent>(_deleteLocalData);
    on<SyncRecordListServerDataEvent>(_sendListData);
    on<SyncRecordSingleServerDataEvent>(_sendSingleData);
  }

  bool isSingleServerLoader = false;
  bool isGrpServerLoader = false;
  bool isDeleteLoader = false;
  bool isConnective = false;

  List<SaveRegistrationFormModel> listOfRegistrationForm = [];
  Box<SaveRegistrationFormModel>? boxOfRegistrationForm;

  _pageLoad(ViewSyncRecordLoadPageEvent event, emit) async {
    emit(ViewSyncRecordPageLoadState());
     isSingleServerLoader = false;
     isGrpServerLoader = false;
    isDeleteLoader = false;
    listOfRegistrationForm = [];
    isConnective = await ConnectivityHelper.allConnectivityCheck(context: event.context);
    listOfRegistrationForm = await HiveDataBase.registrationFormBox!.values.toList();
    _eventCompleted(emit);
  }


  _updateLocalData(ViewSyncRecordLoadUpdateLocalDataEvent event, emit) async {

  }

  _deleteLocalData(DeleteLocalDataEvent event, emit) {
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
              return HiveDataBase.registrationFormBox?.deleteAt(event.index);
            }
            _eventCompleted(emit);
          },
        ));
  }

  _sendListData(SyncRecordListServerDataEvent event, emit) async {
    try{
      if(HiveDataBase.registrationFormBox!.values.isNotEmpty){
        List<SaveRegistrationFormModel> listOfLocalHive =  await HiveDataBase.registrationFormBox!.values.toList();
        for (int i = 0; i < listOfLocalHive.length; i++) {
          isGrpServerLoader = true;
          _eventCompleted(emit);
          var res = await ViewSyncRecordHelper.sendData(context: event.context, custRegSyncData: listOfRegistrationForm[i]);
          if (res != null) {
            isGrpServerLoader = false;
            _eventCompleted(emit);
            if(HiveDataBase.registrationFormBox!.values.length == 1){
              await HiveDataBase.registrationFormBox!.clear();
              Navigator.pushReplacementNamed(event.context, RoutesName.viewSyncRecord);
              _eventCompleted(emit);
            } else{
              await Utils.successSnackBar(msg: res.message![0].message!, context: event.context);
              await HiveDataBase.registrationFormBox!.deleteAt(i);
              _eventCompleted(emit);
            }
          }
        }
      }
    } catch(e){
      isGrpServerLoader = false;
      log("_saveServerData-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(), context: event.context);
    }
  }


  _sendSingleData(SyncRecordSingleServerDataEvent event, emit) async {
    try{
      if(HiveDataBase.registrationFormBox!.values.isNotEmpty){
        isSingleServerLoader = true;
        _eventCompleted(emit);
        var res = await ViewSyncRecordHelper.sendData(context: event.context, custRegSyncData: listOfRegistrationForm[event.index]);
        if (res != null) {
          isSingleServerLoader = false;
          _eventCompleted(emit);
          log("Data Length P ============== ${HiveDataBase.registrationFormBox!.values.length}");
          await Utils.successSnackBar(msg: res.message![0].message!, context: event.context);
          await HiveDataBase.registrationFormBox!.deleteAt(event.index);
          Navigator.pushReplacementNamed(event.context, RoutesName.viewSyncRecord);
          _eventCompleted(emit);
        }
      }
    } catch(e){
      isSingleServerLoader = false;
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
      isGrpServerLoader: isGrpServerLoader,
      isSingleServerLoader: isSingleServerLoader,
      isConnective: isConnective,
      isDeleteLoader: isDeleteLoader,
      listOfRegistrationForm: listOfRegistrationForm,
      boxOfRegistrationForm: boxOfRegistrationForm,
    ));
  }

}
