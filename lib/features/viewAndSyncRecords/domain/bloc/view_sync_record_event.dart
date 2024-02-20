import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

abstract class ViewSyncRecordEvent extends Equatable {}

class ViewSyncRecordLoadPageEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  ViewSyncRecordLoadPageEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class ViewSyncRecordLoadSaveServerDataEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  ViewSyncRecordLoadSaveServerDataEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class ViewSyncRecordDeleteLocalEvent extends ViewSyncRecordEvent {
  final int index;
  final BuildContext context;
   String mobileNo;
   List<SaveCustomerRegistrationOfflineModel> offlineDataList;
   Box<SaveCustomerRegistrationOfflineModel> offlineBox;
  ViewSyncRecordDeleteLocalEvent({
    required this.index,
    required this.context,
    required this.mobileNo,
    required this.offlineDataList,
    required this.offlineBox,
  });
  @override
  List<Object?> get props => [index, context, mobileNo,offlineDataList,offlineBox ];
}
