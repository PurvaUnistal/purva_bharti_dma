import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {}

class InternetInitState extends InternetState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ConnectedState extends InternetState {
  final String msg;
  final bool isConnected;
  final bool isWifi;
  final bool isMobile;
  ConnectedState(
      {required this.msg,
      required this.isConnected,
      required this.isWifi,
      required this.isMobile});
  @override
  // TODO: implement props
  List<Object?> get props => [msg, isConnected, isWifi, isMobile];
}

class NotConnectedState extends InternetState {
  final String msg;
  NotConnectedState({required this.msg});
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
