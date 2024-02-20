// To parse this JSON data, do
//
//     final gePropertyClassModel = gePropertyClassModelFromJson(jsonString);

import 'dart:convert';

List<GetPropertyClassModel> getPropertyClassModelFromJson(String str) =>
    List<GetPropertyClassModel>.from(
        json.decode(str).map((x) => GetPropertyClassModel.fromJson(x)));

String getPropertyClassModelToJson(List<GetPropertyClassModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPropertyClassModel {
  final String? name;
  final String? id;

  GetPropertyClassModel({
    this.name,
    this.id,
  });

  factory GetPropertyClassModel.fromJson(Map<String, dynamic> json) =>
      GetPropertyClassModel(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
  @override
  String toString() {
    // TODO: implement toString
    return name!;
  }
}
