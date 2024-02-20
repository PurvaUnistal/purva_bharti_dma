// To parse this JSON data, do
//
//     final getPropertyCategoryModel = getPropertyCategoryModelFromJson(jsonString);

import 'dart:convert';

List<GetPropertyCategoryModel> getPropertyCategoryModelFromJson(String str) =>
    List<GetPropertyCategoryModel>.from(
        json.decode(str).map((x) => GetPropertyCategoryModel.fromJson(x)));

String getPropertyCategoryModelToJson(List<GetPropertyCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPropertyCategoryModel {
  final String? name;
  final String? id;

  GetPropertyCategoryModel({
    this.name,
    this.id,
  });

  factory GetPropertyCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetPropertyCategoryModel(
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
