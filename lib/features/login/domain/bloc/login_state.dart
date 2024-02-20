import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginGetSubmitState extends LoginState {
  final bool isPageLoader;
  final bool isPassword;
  LoginGetSubmitState({required this.isPageLoader, required this.isPassword});
  @override
  // TODO: implement props
  List<Object> get props => [isPageLoader, isPassword];
}
