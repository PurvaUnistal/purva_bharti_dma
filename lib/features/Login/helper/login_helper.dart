import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class LoginHelper {
  static String p = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static Future<dynamic> textFieldValidation(
      {required String email,
        required password,
        required BuildContext context}) async {
    try {
      if (email.isEmpty) {
        Utils.errorSnackBar(msg: AppString.emailLabel,context: context);
        return false;
      } else if (password.isEmpty) {
        Utils.errorSnackBar(msg: AppString.passwordLabel,context: context);
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      Utils.errorSnackBar(msg: e.toString(),context: context);
      return false;
    }
  }

  static Future<dynamic> loginData({
    required String emailId,
    required String password,
    required BuildContext context}) async {
    var param = {
      "email" : emailId,
      "password" : password,
    };
    try {
      var res = await ApiServer.postData(urlEndPoint: AppUrl.auth, context: context, body: json.encode(param));
      if(res != null && res["status"] == 200 && res["messages"] == "User logged In successfully"){
        return LoginModel.fromJson(res);
      } if(res != null && res["status"] == 401){
        if(res["messages"] == "Unauthorised"){
          return Utils.errorSnackBar(msg : res["messages"],context:context);
        } else {
          return Utils.errorSnackBar(msg : res["messages"]["email"],context: context);
        }
      }else {
        return Utils.errorSnackBar(msg : res,context: context);
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      // return null;
    }

  }
}
