/// success : 415
/// errors : [{"email_id":"The email_id field must contain a valid email address."}]

class SyncErrorResponse {
  int _success;
  List<Errors> _errors;

  int get success => _success;
  List<Errors> get errors => _errors;

  SyncErrorResponse({
      int success, 
      List<Errors> errors}){
    _success = success;
    _errors = errors;
}

  SyncErrorResponse.fromJson(dynamic json) {
    _success = json['success'];
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = _success;
    if (_errors != null) {
      map['errors'] = _errors.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// email_id : "The email_id field must contain a valid email address."

class Errors {
  String _emailId;

  String get emailId => _emailId;

  Errors({
      String emailId}){
    _emailId = emailId;
}

  Errors.fromJson(dynamic json) {
    _emailId = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['email_id'] = _emailId;
    return map;
  }

}