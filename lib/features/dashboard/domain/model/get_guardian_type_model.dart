// To parse this JSON data, do
//
//     final getGuardianTypeModel = getGuardianTypeModelFromJson(jsonString);

import 'dart:convert';

GetGuardianTypeModel getGuardianTypeModelFromJson(String str) => GetGuardianTypeModel.fromJson(json.decode(str));

String getGuardianTypeModelToJson(GetGuardianTypeModel data) => json.encode(data.toJson());

class GetGuardianTypeModel {
  final String? father;
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
