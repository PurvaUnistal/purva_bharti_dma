class MobileNoError {
  int success;
  List<Errors> errors;

  MobileNoError({this.success, this.errors});

  MobileNoError.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['errors'] != null) {
      errors = new List<Errors>();
      json['errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String mobileNumber;

  Errors({this.mobileNumber});

  Errors.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    return data;
  }
}