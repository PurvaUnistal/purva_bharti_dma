import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/common/HiveDatabase/hive_database.dart';


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

   SaveCustomerRegistrationOfflineModel _offlineDataList = SaveCustomerRegistrationOfflineModel();
   SaveCustomerRegistrationOfflineModel get offlineDataList => _offlineDataList;
  // Box<SaveCustomerRegistrationOfflineModel>? offlineBox;

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

  _deleteLocalData(ViewSyncRecordDeleteLocalDataEvent event, emit) async {
     return showDialog(
        context: event.context,
        builder: (BuildContext context) => MessageBoxTwoButtonPopWidget(
            message: "Do you really want to delete?",
            subMessage: "Mobile No : ${event.mobileNo}",
            okButtonText: "Yes",
           onPressed: () async {
            if (HiveDataBase.customerRegBox!.values.isNotEmpty) {
              Navigator.pop(event.context);
              Navigator.pushReplacementNamed(context, RoutesName.viewSyncRecordPage);
              log("Data Length P ============== ${HiveDataBase.customerRegBox!.values.length}");
              return await HiveDataBase.customerRegBox!.delete(event.index);
            }
            _eventCompleted(emit);
            },
        ));
  }

  _saveServerData(ViewSyncRecordLoadSaveServerDataEvent event, emit) async {
    _isSaveServerLoader = true;
    _eventCompleted(emit);
    var res = await ViewSyncRecordHelper.leadSaveInServer(context: event.context);
    log("resLeadSaveInServer==>${res.toString()}");
    if (res != null) {
      _isSaveServerLoader = false;
      _eventCompleted(emit);
      log('Great Success! \n Record Save');
      Utils.errorSnackBar(res.messages.toString(), event.context);
      Navigator.pushReplacementNamed(event.context, RoutesName.dashboardView);
    }
  }

  _eventCompleted(Emitter<ViewSyncRecordState> emit) {
    emit(ViewSyncRecordDataState(
      isSaveServerLoader: isSaveServerLoader,
      isDeleteLoader: isDeleteLoader,
      saveCustomerRegistrationOfflineList: offlineDataList,
    //  saveCustomerRegistrationOfflineData: offlineBox!,
    ));
  }

}
