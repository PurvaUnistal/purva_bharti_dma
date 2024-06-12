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
  final List<SaveRegistrationFormModel>? listOfRegistrationForm;
  final Box<SaveRegistrationFormModel>? boxOfRegistrationForm;
  ViewSyncRecordDataState({
    required this.isSaveServerLoader,
    required this.isDeleteLoader,
    required this.listOfRegistrationForm,
    required this.boxOfRegistrationForm,
  });

  @override
  List<Object?> get props => [
    isSaveServerLoader,
    isDeleteLoader,
    listOfRegistrationForm,
    boxOfRegistrationForm,
  ];
}
