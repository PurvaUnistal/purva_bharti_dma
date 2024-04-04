import 'package:pbg_app/ExportFile/export_file.dart';


abstract class ViewSyncRecordState extends Equatable {}

class ViewSyncRecordInitialState extends ViewSyncRecordState {
  @override
  List<Object> get props => [];
}

class ViewSyncRecordPageLoadState extends ViewSyncRecordState {
  @override
  List<Object> get props => [];
}

class ViewSyncRecordDataState extends ViewSyncRecordState {
  final bool isSaveServerLoader;
  final bool isDeleteLoader;
//  final SaveCustomerRegistrationOfflineModel saveCustomerRegistrationOfflineList;
 // final Box<SaveCustomerRegistrationOfflineModel> saveCustomerRegistrationOfflineData ;
  ViewSyncRecordDataState({required this.isSaveServerLoader, required this.isDeleteLoader,
  //  required this.saveCustomerRegistrationOfflineList,
  //  required this.saveCustomerRegistrationOfflineData,
  });

  @override
  List<Object> get props => [isSaveServerLoader, isDeleteLoader,
 //   saveCustomerRegistrationOfflineList,
  //  saveCustomerRegistrationOfflineData
  ];
}
