class ForgotResponse {
  int success;
  bool error;
  String message;

  ForgotResponse({this.success, this.error, this.message});

  ForgotResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}