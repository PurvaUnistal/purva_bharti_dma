import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable {}

class OnConnectedEvent extends InternetEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotConnectedEvent extends InternetEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
