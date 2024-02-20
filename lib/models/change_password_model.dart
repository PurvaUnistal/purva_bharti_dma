// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChangePasswordModel changePasswordModel(var json) {
  return ChangePasswordModel.fromJson(json);
}

class ChangePasswordModel {
  final int success;
  final bool error;
  final String message;

  ChangePasswordModel({
    required this.success,
    required this.error,
    required this.message,
  });

  factory ChangePasswordModel.fromRawJson(String str) =>
      ChangePasswordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
      };
}

class ChangePasswordResponse {
  final String userId;
  final String password;
  final String confirmPassword;
  ChangePasswordResponse(
      {required this.userId,
      required this.password,
      required this.confirmPassword});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "userid": userId,
      "password": password,
      "confirmpassword": confirmPassword
    };
    return map;
  }
}
