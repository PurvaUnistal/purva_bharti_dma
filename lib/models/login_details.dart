class LoginDetails {
  int status;
  bool error;
  String messages;
  String token;
  User user;
  String exptime;

  LoginDetails(
      {this.status,
        this.error,
        this.messages,
        this.token,
        this.user,
        this.exptime});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    exptime = json['exptime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['messages'] = this.messages;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['exptime'] = this.exptime;
    return data;
  }
}
class User {
  String id;
  String email;
  String schema;
  String role;
  String name;
  String userStatus;
  String pwdChanged;
  String modules;

  User({this.id, this.email, this.schema, this.role, this.name, this.userStatus,
    this.pwdChanged,
    this.modules,});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    schema = json['schema'];
    role = json['role'];
    name = json['name'];
    userStatus = json['user_status'];
    pwdChanged = json['pwd_changed'];
    modules = json['modules'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['schema'] = this.schema;
    data['role'] = this.role;
    data['name'] = this.name;
    data['user_status'] = this.userStatus;
    data['pwd_changed'] = this.pwdChanged;
    data['modules'] = this.modules;
    return data;
  }
}


class LoginError {
  int status;
  bool error;
  String messages;

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