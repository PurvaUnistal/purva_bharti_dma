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
  final String? owner;
  @HiveField(1)
  final String? tenant;
  @HiveField(2)
  final String? unoccupied;

  GetResidentStatusModel({
    this.owner,
    this.tenant,
    this.unoccupied,
  });

  factory GetResidentStatusModel.fromJson(Map<String, dynamic> json) => GetResidentStatusModel(
        owner: json["Owner"],
        tenant: json["Tenant"],
        unoccupied: json["Unoccupied"],
      );

  Map<String, dynamic> toJson() => {
        "Owner": owner,
        "Tenant": tenant,
        "Unoccupied": unoccupied,
      };
}
