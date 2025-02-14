import 'dart:async';

import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {}

class DashboardInitState extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DashboardPageLoadState extends DashboardState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DashboardGetAllDataState extends DashboardState {
  final bool isPageLoader;
  final bool isLoader;
  final String schema;

  DashboardGetAllDataState(
      {required this.isPageLoader,
      required this.isLoader,
      required this.schema});

  @override
  // TODO: implement props
  List<Object?> get props => [
        isPageLoader,
        isLoader,
        schema
      ];
}
