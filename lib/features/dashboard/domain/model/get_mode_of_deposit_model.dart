class GetModeOfDepositModel {
  String? s1;
  String? s2;

  GetModeOfDepositModel({this.s1, this.s2});

  GetModeOfDepositModel.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    return data;
  }
}
