import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {}

class DashboardInitState extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DashboardPageLoadState extends DashboardInitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class DashboardGetAllDataState extends DashboardInitState {
  final bool isLoader;
  final String? schema;
  DashboardGetAllDataState({required this.isLoader, required this.schema});

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoader,
    schema
  ];
}
