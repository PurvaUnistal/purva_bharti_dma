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

  bool _isPassword = false;

  bool get isPassword => _isPassword;

  LoginModel _loginModel = LoginModel();

  LoginModel get loginModel => _loginModel;

  _pageLoad(LoginLoadingPageEvent event, emit) async {
    emailId = "";
    password = "";
    _isPassword = true;
    _isPageLoader = false;
    _eventCompleted(emit);
  }

  _setEmailId(LoginSetEmailEvent event, emit) {
    emailId = event.email.toString().replaceAll(" ", "");
  }

  _setPassword(LoginSetPasswordEvent event, emit) {
    password = event.password.toString().replaceAll(" ", "");
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
            prefs.setBool(GlobalConstants.isUserLogIn, true);
            prefs.setString(GlobalConstants.username, emailId);
            prefs.setString(GlobalConstants.password, password);
            prefs.setString(GlobalConstants.id, res.user!.id);
            prefs.setString(GlobalConstants.token, res.token!);
            prefs.setString(GlobalConstants.schema, res.user!.schema);
            prefs.setString(GlobalConstants.name, res.user!.name);
            prefs.setString(GlobalConstants.changePassword, res.user!.pwdChanged);
            Utils.successToast(res.messages!.toString(), event.context);
            _loginModel = res;
            /*Navigator.pushAndRemoveUntil(
              event.context,
              MaterialPageRoute(builder: (context) => RegistrationForm()),
              (Route<dynamic> route) => false,
            );*/
            Navigator.pushReplacementNamed(event.context, RoutesName.dashboardView);
          } else if (res.error == true) {
            return Utils.failureMeg(res.messages.toString(), event.context);
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
