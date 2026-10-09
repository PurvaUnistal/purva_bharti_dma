import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pbg_app/features/Login/domain/model/login_model.dart';

import 'enums.dart';
import 'environment_config.dart';

class AppConfig {
  static AppConfig? instance;
  static String? baseUrl;
  RoleType? roleType;
  Client? client;
  LoginModel loginData = LoginModel();
  static AppConfig? instanceInit() {
    instance ??= AppConfig();
    return instance;
  }

  String buildNumber = "";

  static void init(BuildContext context) {
    baseUrl = EnvironmentConfig.of(context)!.generalUrlBaseFlavour;
    log("baseUrl --> $baseUrl");
  }
  setBuildNumber({required String value}) {
    buildNumber = value;
  }


  setClient({required Client client}){
    this.client =  client;
  }

  setLoginData({required LoginModel newLoginData}) {
    this.loginData = newLoginData;
  }

  static DeviceType getDeviceType({BuildContext? context}) {
    var isPortrait =  true;
    if(context != null){
      isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    }

    final MediaQueryData data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single);
    /*   return data.size.shortestSide <= 600
        ? DeviceType.phone
        : DeviceType.tablet;*/
    return isPortrait == true
        ? DeviceType.phone
        : DeviceType.tablet;
  }

  /// Logout pe call hota hai.
  /// Saara user data reset ho jaata hai, lekin buildNumber aur client bache rehte hain,
  /// kyunki ye app ke hain, user ke nahi.
  /// NOTE: Agar client me user ka token/auth header set hota hai,
  /// to `..client = old?.client` wali line hata do aur login ke baad naya client set karo.
  static void reset() {
    final old = instance;
    instance = AppConfig()
      ..buildNumber = old?.buildNumber ?? ""
      ..client = old?.client;
  }
}