class GetSocietyAllowModel {
  String? s0;
  String? s1;

  GetSocietyAllowModel({this.s0, this.s1});

  GetSocietyAllowModel.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    return data;
  }
}
