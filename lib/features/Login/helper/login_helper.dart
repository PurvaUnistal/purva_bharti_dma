import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Service/api_server_dio.dart';

class LoginHelper {
  static String p =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static Future<dynamic> textFieldValidation({
    required String email,
    required password,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty) {
        Utils.errorSnackBar(msg: AppString.emailLabel, context: context);
        return false;
      } else if (password.isEmpty) {
        Utils.errorSnackBar(msg: AppString.passwordLabel, context: context);
        return false;
      }
      return true;
    } catch (e) {
      log(e.toString());
      Utils.errorSnackBar(msg: e.toString(), context: context);
      return false;
    }
  }

  static getUniqueDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
    return null;
  }

  static Future<dynamic> loginData({
    required String emailId,
    required String password,
    required BuildContext context,
  }) async {
    var deviceId = await getUniqueDeviceId();
    Map<String, String> para = {
      "email": emailId,
      "password": password,
      "deviceId": deviceId,
    };
    try {
      var res = await ApiHelperDio.postData(
        urlEndPoint: AppUrl.auth,
        param: para,
        context: context,
      );
      if (res != null && res["error"] == false) {
        if (res["user"]["role"] == "dma" &&
            res["messages"] == "User logged In successfully") {
          return LoginModel.fromJson(res);
        } else {
          Utils.errorSnackBar(
            msg: "Invalid role ID. Please check your credentials.",
            context: context,
          );
          return null;
        }
      } else if (res != null && res["error"] == true) {
        await Utils.errorSnackBar(msg: res["messages"], context: context);
        return null;
      } else {
        await Utils.errorSnackBar(msg: res["messages"], context: context);
        return null;
      }
    } catch (e) {
      log("catchLogin-->${e.toString()}");
      Utils.errorSnackBar(
        msg: "An error occurred. Please try again.",
        context: context,
      );
      return null;
    }
  }
}
