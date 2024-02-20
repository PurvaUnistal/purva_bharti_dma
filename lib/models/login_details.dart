// To parse this JSON data, do
//
//     final loginDetails = loginDetailsFromJson(jsonString);

import 'dart:convert';

LoginDetails loginDetailsFromJson(String str) =>
    LoginDetails.fromJson(json.decode(str));

String loginDetailsToJson(LoginDetails data) => json.encode(data.toJson());

class LoginDetails {
  final int status;
  final bool error;
  final String messages;
  final String token;
  final User user;
  final String exptime;

  LoginDetails({
    required this.status,
    required this.error,
    required this.messages,
    required this.token,
    required this.user,
    required this.exptime,
  });

  factory LoginDetails.fromJson(Map<String, dynamic> json) => LoginDetails(
        status: json["status"],
        error: json["error"],
        messages: json["messages"],
        token: json["token"],
        user: User.fromJson(json["user"]),
        exptime: json["exptime"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages,
        "token": token,
        "user": user.toJson(),
        "exptime": exptime,
      };
}

class User {
  final String id;
  final String email;
  final String name;
  final String userStatus;
  final String pwdChanged;
  final String modules;
  final String schema;
  final String role;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.userStatus,
    required this.pwdChanged,
    required this.modules,
    required this.schema,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        userStatus: json["user_status"],
        pwdChanged: json["pwd_changed"],
        modules: json["modules"],
        schema: json["schema"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "user_status": userStatus,
        "pwd_changed": pwdChanged,
        "modules": modules,
        "schema": schema,
        "role": role,
      };
}

class LoginError {
  int? status;
  bool? error;
  String? messages;

  LoginError({this.status, this.error, this.messages});

  LoginError.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    //messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['messages'] = this.messages;
    return data;
  }
}
