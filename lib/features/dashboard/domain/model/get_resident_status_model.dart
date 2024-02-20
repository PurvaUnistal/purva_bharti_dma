// To parse this JSON data, do
//
//     final geResidentStatusModel = geResidentStatusModelFromJson(jsonString);

import 'dart:convert';

GetResidentStatusModel getResidentStatusModelFromJson(String str) => GetResidentStatusModel.fromJson(json.decode(str));

String getResidentStatusModelToJson(GetResidentStatusModel data) => json.encode(data.toJson());

class GetResidentStatusModel {
  final String? owner;
  final String? tenant;
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
