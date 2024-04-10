// To parse this JSON data, do
//
//     final geResidentStatusModel = geResidentStatusModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_resident_status_model.g.dart';


GetResidentStatusModel getResidentStatusModelFromJson(String str) => GetResidentStatusModel.fromJson(json.decode(str));

String getResidentStatusModelToJson(GetResidentStatusModel data) => json.encode(data.toJson());



@HiveType(typeId: HiveTypeId.GetResStatusId)

class GetResidentStatusModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetResidentStatusModel({
    this.key,
    this.value,
  });

  factory GetResidentStatusModel.fromJson(Map<String, dynamic> json) => GetResidentStatusModel(
        key: json["key"],
        value: json["value"],
      );

  static List<GetResidentStatusModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetResidentStatusModel(key: e.key, value: e.value)).toList();
  }

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
  @override
  String toString() {
    // TODO: implement toString
    return value ?? "";
  }
}
