import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/features/Login/domain/bloc/login_event.dart';
import 'package:pbg_app/features/Login/domain/bloc/login_state.dart';
import 'package:pbg_app/features/Login/helper/login_helper.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<LoginPageLoadingEvent>(_pageLoad);
    on<LoginSetEmailIdEvent>(_setEmailId);
    on<LoginSetPasswordEvent>(_setPassword);
    on<LoginHideShowPasswordEvent>(_setHideShowPassword);
    on<LoginSubmitDataEvent>(_setSubmitLoginData);
  }

  String emailId = "";
  String password = "";
  String deviceId = "";

  bool isPageLoader = false;
  bool isPassword = false;

  LoginModel loginModel = LoginModel();

  _pageLoad(LoginPageLoadingEvent event, emit) async {
    emailId = "";
    password = "";
    isPassword = true;
    isPageLoader = false;
    loginModel = LoginModel();
    _eventCompleted(emit);
  }

  _setEmailId(LoginSetEmailIdEvent event, emit) {
    emailId = event.emailId.toString().replaceAll(" ", "");
  }

  _setPassword(LoginSetPasswordEvent event, emit) {
    password = event.password.toString().replaceAll(" ", "");
  }

  _setHideShowPassword(LoginHideShowPasswordEvent event, emit) {
    isPassword = event.isHideShow;
    _eventCompleted(emit);
  }

  _setSubmitLoginData(LoginSubmitDataEvent event, emit) async {
    var validationCheck = await LoginHelper.textFieldValidation(
        email: emailId, password: password, context: event.context);
    if (validationCheck == true) {
      try {
        isPageLoader = true;
        _eventCompleted(emit);
        var res = await LoginHelper.loginData(emailId: emailId, password: password, context: event.context);
        if (res != null && res.user != null) {
          isPageLoader = false;
          _eventCompleted(emit);
            loginModel = res;
            Utils.successSnackBar(msg: res.messages!,context: event.context);
            await SharedPref.setString(key: PrefsValue.emailVal, value: res.user!.email.toString());
            await SharedPref.setString(key: PrefsValue.passwordVal, value:password.toString());
            await SharedPref.setString(key:  PrefsValue.token, value: res.token.toString());
            await SharedPref.setString(key:  PrefsValue.schema, value: res.user!.schema.toString());
            await SharedPref.setString(key:  PrefsValue.userRole, value: res.user!.role.toString());
            await SharedPref.setString(key:  PrefsValue.userName, value: res.user!.name.toString());
            await SharedPref.setString(key:  PrefsValue.userId, value: res.user!.id.toString());
            Navigator.pushReplacementNamed(event.context, RoutesName.dashboard);
        } else {
          isPageLoader = false;
          _eventCompleted(emit);
        }
      } catch (e) {
        isPageLoader = false;
        _eventCompleted(emit);
        log(e.toString());
      }
    }
    _eventCompleted(emit);
  }

  _eventCompleted(Emitter<LoginState> emit) {
    emit(LoginFetchDataState(
      isPageLoader: isPageLoader,
      isPassword: isPassword,
      loginModel: loginModel,
    ));
  }
}


