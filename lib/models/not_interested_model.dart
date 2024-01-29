class NotInterestedModel {
  final String no;
  final String yes;
  NotInterestedModel({this.no, this.yes});

  factory NotInterestedModel.fromJson(Map<String, dynamic> json) =>
      NotInterestedModel(
        no: json['0'],
        yes: json['1'],
      );

  Map<String, dynamic> toJson() => {'0': no, '1': yes};
}
