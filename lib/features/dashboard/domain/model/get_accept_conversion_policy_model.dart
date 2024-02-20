class GetAcceptConversionPolicyModel {
  String? s1;
  String? s2;
  String? s3;

  GetAcceptConversionPolicyModel({this.s1, this.s2, this.s3});

  GetAcceptConversionPolicyModel.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    return data;
  }
}
