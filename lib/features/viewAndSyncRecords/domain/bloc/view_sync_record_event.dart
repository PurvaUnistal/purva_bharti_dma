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
  ViewSyncRecordLoadUpdateLocalDataEvent({required this.context, required this.index,});
  @override
  List<Object?> get props => [context, index];
}

class ViewSyncRecordDeleteLocalDataEvent extends ViewSyncRecordEvent {
  final int index;
  final BuildContext context;
   String mobileNo;
  ViewSyncRecordDeleteLocalDataEvent({required this.index, required this.context, required this.mobileNo,});
  @override
  List<Object?> get props => [index, context,mobileNo];
}

class ViewSyncRecordLoadSaveServerDataEvent extends ViewSyncRecordEvent {
  final BuildContext context;
  ViewSyncRecordLoadSaveServerDataEvent({
    required this.context,
  });
  @override
  List<Object?> get props => [context,];
}
