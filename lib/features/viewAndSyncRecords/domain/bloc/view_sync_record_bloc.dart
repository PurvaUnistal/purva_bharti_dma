import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';


class ViewSyncRecordBloc extends Bloc<ViewSyncRecordEvent, ViewSyncRecordState> {
  ViewSyncRecordBloc() : super(ViewSyncRecordInitialState()) {
    on<ViewSyncRecordLoadPageEvent>(_pageLoad);
    on<ViewSyncRecordDeleteLocalEvent>(_deleteLocalData);
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
    _offlineDataList = SaveCustomerRegistrationOfflineModel();
  //  offlineDataList = [];
    _eventCompleted(emit);
  }

  _deleteLocalData(ViewSyncRecordDeleteLocalEvent event, emit) async {
    await showDialog(
        context: event.context,
        builder: (BuildContext mContext) => MessageBoxTwoButtonPopWidget(
            message: "Do you really want to delete?",
            subMessage: "Mobile No : ${event.mobileNo}",
            okButtonText: "Yes",
           onPressed: () async {
            if (HiveDataBase.leadBoxCustomerRegistration!.values.isNotEmpty) {
              log("Data Length P ============== ${HiveDataBase.leadBoxCustomerRegistration!.values.length}");
              _offlineDataList = event.offlineDataList.removeAt(event.index);
              await HiveDataBase.leadBoxCustomerRegistration!.deleteAt(event.index);
              log("Data Length D ============== ${HiveDataBase.leadBoxCustomerRegistration!.values.length}");
            }
            _eventCompleted(emit);
            Navigator.pop(event.context);
          },
        ));
  }

  _saveServerData(ViewSyncRecordLoadSaveServerDataEvent event, emit) async {
    _isSaveServerLoader = true;
    _eventCompleted(emit);
    var res = await ViewSyncRecordHelper.leadSaveInServer(context: event.context,
    );
    log("resLeadSaveInServer==>${res.toString()}");
    if (res != null) {
      _isSaveServerLoader = false;
      _eventCompleted(emit);
      log('Great Success! \n Record Save');
      Utils.failureMeg(res.messages.toString(), event.context);
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
