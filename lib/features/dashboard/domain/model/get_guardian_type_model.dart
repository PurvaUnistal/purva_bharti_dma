// To parse this JSON data, do
//
//     final getGuardianTypeModel = getGuardianTypeModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_guardian_type_model.g.dart';

GetGuardianTypeModel getGuardianTypeModelFromJson(String str) => GetGuardianTypeModel.fromJson(json.decode(str));

String getGuardianTypeModelToJson(GetGuardianTypeModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeId.GetGuardianTypeId)

class GetGuardianTypeModel {
  @HiveField(0)
  final String? father;
  @HiveField(1)
  final String? spouse;

  GetGuardianTypeModel({
    this.father,
    this.spouse,
  });

  factory GetGuardianTypeModel.fromJson(Map<String, dynamic> json) => GetGuardianTypeModel(
        father: json["Father"],
        spouse: json["Spouse"],
      );

  Map<String, dynamic> toJson() => {
        "Father": father,
        "Spouse": spouse,
      };
}
