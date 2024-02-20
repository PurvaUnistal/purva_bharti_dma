class GetInitialDepositStatusModel {
  String? s0;
  String? s1;
  String? s2;

  GetInitialDepositStatusModel({this.s0, this.s1, this.s2});

  GetInitialDepositStatusModel.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    return data;
  }
}
