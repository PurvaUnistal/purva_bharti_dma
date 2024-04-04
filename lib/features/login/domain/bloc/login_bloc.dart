import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitState()) {
    on<LoginLoadingPageEvent>(_pageLoad);
    on<LoginSetEmailEvent>(_setEmailId);
    on<LoginSetPasswordEvent>(_setPassword);
    on<LoginSetHideShowPwdEvent>(_setHideShowPassword);
    on<LoginSetSubmitDataEvent>(_setSubmitLoginData);
  }

  String emailId = "";
  String password = "";
  String deviceId = "";

  bool _isPageLoader = false;
  bool get isPageLoader => _isPageLoader;

  bool _isPassword = true;
  bool get isPassword => _isPassword;

  LoginModel _loginModel = LoginModel();
  LoginModel get loginModel => _loginModel;

  _pageLoad(LoginLoadingPageEvent event, emit) async {
    emit(LoginPageLoaderState());
    _isPageLoader = false;
    _isPassword = true;
    emailId = "";
    password = "";
    _eventCompleted(emit);
  }

  _setEmailId(LoginSetEmailEvent event, emit) {
    emailId = event.email.toString().replaceAll(" ", "");
    _eventCompleted(emit);
  }

  _setPassword(LoginSetPasswordEvent event, emit) {
    password = event.password.toString().replaceAll(" ", "");
    _eventCompleted(emit);
  }

  _setHideShowPassword(LoginSetHideShowPwdEvent event, emit) {
    _isPassword = event.isHideShowPwd;
    _eventCompleted(emit);
  }

  _setSubmitLoginData(LoginSetSubmitDataEvent event, emit) async {
    var validationCheck = await LoginHelper.textFieldValidation(email: emailId, password: password, context: event.context);
    if (validationCheck == true) {
      try {
        _isPageLoader = true;
        _eventCompleted(emit);
        var res = await LoginHelper.loginData(emailId: emailId, password: password, context: event.context);
        if (res != null) {
          _isPageLoader = false;
          _eventCompleted(emit);
          if (res.status == 200 && (res.user!.role == 'dma')) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await PreferenceUtils.setString(key: PrefsValue.userEmail, value: emailId);
            await PreferenceUtils.setString(key: PrefsValue.userPwd, value: password);
            await PreferenceUtils.setString(key: PrefsValue.userId, value: res.user!.id);
            await PreferenceUtils.setString(key: PrefsValue.token, value: res.token!);
            await PreferenceUtils.setString(key: PrefsValue.schema, value: res.user!.schema);
            await PreferenceUtils.setString(key: PrefsValue.userName, value: res.user!.name);
            prefs.setString(PrefsValue.pwdChanged, res.user!.pwdChanged);
            Utils.successSnackBar(msg:res.messages!.toString(),context: event.context);
            _loginModel = res;
            Navigator.pushReplacementNamed(event.context, RoutesName.dashboardView);
          }
          else if (res.error == true) {
            _isPageLoader = false;
            _eventCompleted(emit);
            return Utils.errorSnackBar(msg:res.messages.toString(), context:event.context);
          }
        } else {
          _isPageLoader = false;
          _eventCompleted(emit);
        }
      } catch (e) {
        _isPageLoader = false;
        _eventCompleted(emit);
        log(e.toString());
      }
    }
    _eventCompleted(emit);
  }

  _eventCompleted(Emitter<LoginState> emit) {
    emit(LoginGetSubmitState(
      isPageLoader: isPageLoader,
      isPassword: isPassword,
    ));
  }
}
