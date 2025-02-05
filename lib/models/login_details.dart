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
    status = json['status'] ?? "";
    error = json['error'] ?? "";
    messages = json['messages'] ?? "";
    token = json['token'] ?? "";
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    exptime = json['exptime'] ?? "";
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
  String gaId;
  String moduleId;
  String name;
  String userStatus;
  String pwdChanged;
  dynamic modules;
  String schema;
  String role;
  List<Accessright> accessright;
  String spreadId;
  String sectionId;

  User(
      {this.id,
        this.email,
        this.gaId,
        this.moduleId,
        this.name,
        this.userStatus,
        this.pwdChanged,
        this.modules,
        this.schema,
        this.role,
        this.accessright,
        this.spreadId,
        this.sectionId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    email = json['email'] ?? "";
    gaId = json['ga_id'] ?? "";
    moduleId = json['module_id'] ?? "";
    name = json['name'] ?? "";
    userStatus = json['user_status'] ?? "";
    pwdChanged = json['pwd_changed'] ?? "";
    modules = json['modules'] ?? "";
    schema = json['schema'] ?? "";
    role = json['role'] ?? "";
    if (json['accessright'] != null) {
      accessright = <Accessright>[] ?? "";
      json['accessright'].forEach((v) {
        accessright.add(new Accessright.fromJson(v));
      });
    }
    spreadId = json['spread_id'] ?? "";
    sectionId = json['section_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['ga_id'] = this.gaId;
    data['module_id'] = this.moduleId;
    data['name'] = this.name;
    data['user_status'] = this.userStatus;
    data['pwd_changed'] = this.pwdChanged;
    data['modules'] = this.modules;
    data['schema'] = this.schema;
    data['role'] = this.role;
    if (this.accessright != null) {
      data['accessright'] = this.accessright.map((v) => v.toJson()).toList();
    }
    data['spread_id'] = this.spreadId;
    data['section_id'] = this.sectionId;
    return data;
  }
}

class Accessright {
  dynamic menuCode;
  String id;
  String name;
  String submoduleAlias;

  Accessright({this.menuCode, this.id, this.name, this.submoduleAlias});

  Accessright.fromJson(Map<String, dynamic> json) {
    menuCode = json['menu_code'] ?? "";
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    submoduleAlias = json['submodule_alias'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_code'] = this.menuCode;
    data['id'] = this.id;
    data['name'] = this.name;
    data['submodule_alias'] = this.submoduleAlias;
    return data;
  }
}
