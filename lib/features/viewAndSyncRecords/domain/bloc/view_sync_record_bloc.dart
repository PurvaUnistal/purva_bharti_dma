import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';
import 'package:pbg_app/features/viewAndSyncRecords/domain/Model/CustRegSyncModel.dart';


class ViewSyncRecordBloc extends Bloc<ViewSyncRecordEvent, ViewSyncRecordState> {
  ViewSyncRecordBloc() : super(ViewSyncRecordInitialState()) {
    on<ViewSyncRecordLoadPageEvent>(_pageLoad);
    on<ViewSyncRecordLoadUpdateLocalDataEvent>(_updateLocalData);
    on<ViewSyncRecordDeleteLocalDataEvent>(_deleteLocalData);
    on<ViewSyncRecordLoadSaveServerDataEvent>(_saveServerData);
  }

  bool _isSaveServerLoader = false;
  bool get isSaveServerLoader => _isSaveServerLoader;

  bool _isDeleteLoader = false;
  bool get isDeleteLoader => _isDeleteLoader;


  _pageLoad(ViewSyncRecordLoadPageEvent event, emit) {
    emit(ViewSyncRecordPageLoadState());
    _isSaveServerLoader = false;
    _isDeleteLoader = false;
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
            if (HiveDataBase.custRegSyncBox!.values.isNotEmpty) {
              Navigator.pop(event.context);
              Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
              log("Data Length P ============== ${HiveDataBase.custRegSyncBox!.values.length}");
              return await HiveDataBase.custRegSyncBox!.deleteAt(event.index);
            }
            _eventCompleted(emit);
          },
        ));
  }

  _saveServerData(ViewSyncRecordLoadSaveServerDataEvent event, emit) async {
   try{
     _isSaveServerLoader = true;
     _eventCompleted(emit);
     List<CustRegSync> data = await HiveDataBase.custRegSyncBox!.values.toList();
     for (int i = 0; i < data.length; i++) {
       var res = await ViewSyncRecordHelper.sendData(context: event.context, custRegSyncData: data[i]);
       if (res != null) {
         _isSaveServerLoader = false;
         _eventCompleted(emit);
         Utils.successSnackBar(msg: res.message[i].message, context: event.context);
         Navigator.pushReplacementNamed(event.context, RoutesName.viewSyncRecordPage);
       }
     }
   }catch(e){
     log(e.toString());
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
     // saveCustomerRegistrationOfflineList: offlineDataList,
    //  saveCustomerRegistrationOfflineData: offlineBox!,
    ));
  }

}
