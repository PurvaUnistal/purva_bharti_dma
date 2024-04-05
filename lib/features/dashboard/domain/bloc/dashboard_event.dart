import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DashboardEvent extends Equatable {}

class DashboardPageLoadingEvent extends DashboardEvent {
  final BuildContext context;
  DashboardPageLoadingEvent({required this.context});
  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class SelectSyncFetchAllDataEvent extends DashboardEvent {
  final BuildContext context;
  SelectSyncFetchAllDataEvent({required this.context});
  @override
  List<Object?> get props => [context];
}