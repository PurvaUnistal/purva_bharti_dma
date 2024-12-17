import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

abstract class ViewSyncRecordEvent extends Equatable {}

class ViewSyncRecordLoadPageEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  ViewSyncRecordLoadPageEvent({required this.context});
  @override
  List<Object?> get props => [context];
}


class ViewSyncRecordLoadUpdateLocalDataEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  final int index;
  final SaveRegistrationFormModel saveRegistrationFormModel;
  ViewSyncRecordLoadUpdateLocalDataEvent({required this.context, required this.index,required this.saveRegistrationFormModel});
  @override
  List<Object?> get props => [context, index, saveRegistrationFormModel];
}

class DeleteLocalDataEvent extends ViewSyncRecordEvent {
  final int index;
  final BuildContext context;
   String mobileNo;
 DeleteLocalDataEvent({required this.index, required this.context, required this.mobileNo,});
  @override
  List<Object?> get props => [index, context,mobileNo];
}

class SyncRecordListServerDataEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  SyncRecordListServerDataEvent({
    required this.context,
  });
  @override
  List<Object?> get props => [context,];
}

class SyncRecordSingleServerDataEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  int index = 0;
  SyncRecordSingleServerDataEvent({
    required this.context,
    required this.index,
  });
  @override
  List<Object?> get props => [context,index];
}