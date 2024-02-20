import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

abstract class LoginEvent extends Equatable {}

class LoginLoadingPageEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginSetEmailEvent extends LoginEvent {
  final String email;
  LoginSetEmailEvent({required this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class LoginSetPasswordEvent extends LoginEvent {
  final String password;
  LoginSetPasswordEvent({required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
}

class LoginSetHideShowPwdEvent extends LoginEvent {
  final bool isHideShowPwd;
  LoginSetHideShowPwdEvent({required this.isHideShowPwd});
  @override
  // TODO: implement props
  List<Object> get props => [isHideShowPwd];
}

class LoginSetSubmitDataEvent extends LoginEvent {
  final BuildContext context;
  final bool isLoginLoader;
  LoginSetSubmitDataEvent({required this.context, required this.isLoginLoader});
  @override
  // TODO: implement props
  List<Object> get props => [context, isLoginLoader];
}
