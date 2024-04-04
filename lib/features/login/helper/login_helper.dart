import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class LoginHelper {

  static Future<dynamic> textFieldValidation(
      {required String email,
      required password,
      required BuildContext context}) async {
    try {
      if (email.isEmpty) {
        Utils.errorSnackBar(msg:AppString.emailValidation,context: context);
        return false;
      } else if (password.isEmpty) {
        Utils.errorSnackBar(msg:AppString.passwordValidation,context: context);
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      Utils.errorSnackBar(msg:e.toString(),context: context);
      return false;
    }
  }

  static Future<LoginModel?> loginData(
      {required String emailId,
      required String password,
      required BuildContext context}) async {
    LoginRequestModel loginRequestModel = LoginRequestModel(
      email: emailId,
      password: password,
      deviceId: '',
    );
    try {
      dynamic res = await ApiServer.postData(
          urlEndPoint: AppUrl.auth, body: loginRequestModel, context: context);
      return LoginModel.fromJson(res);
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(msg: e.toString(),context: context);
      return null;
      // return Utils.showToast(e.toString());
    }
  }
}
