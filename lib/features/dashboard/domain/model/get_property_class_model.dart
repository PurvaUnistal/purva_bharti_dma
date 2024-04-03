// To parse this JSON data, do
//
//     final gePropertyClassModel = gePropertyClassModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_property_class_model.g.dart';


List<GetPropertyClassModel> getPropertyClassModelFromJson(String str) =>
    List<GetPropertyClassModel>.from(
        json.decode(str).map((x) => GetPropertyClassModel.fromJson(x)));

String getPropertyClassModelToJson(List<GetPropertyClassModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetProClassId)

class GetPropertyClassModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
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
