// To parse this JSON data, do
//
//     final getExistingCookingFuelModel = getExistingCookingFuelModelFromJson(jsonString);

import 'dart:convert';

GetExistingCookingFuelModel getExistingCookingFuelModelFromJson(String str) => GetExistingCookingFuelModel.fromJson(json.decode(str));

String getExistingCookingFuelModelToJson(GetExistingCookingFuelModel data) => json.encode(data.toJson());

class GetExistingCookingFuelModel {
  final String? gasCylinder;
  final String? electric;
  final String? kerosene;
  final String? coal;
  final String? wood;

  GetExistingCookingFuelModel({
    this.gasCylinder,
    this.electric,
    this.kerosene,
    this.coal,
    this.wood,
  });

  factory GetExistingCookingFuelModel.fromJson(Map<String, dynamic> json) => GetExistingCookingFuelModel(
        gasCylinder: json["Gas Cylinder"],
        electric: json["Electric"],
        kerosene: json["Kerosene"],
        coal: json["Coal"],
        wood: json["Wood"],
      );

  Map<String, dynamic> toJson() => {
        "Gas Cylinder": gasCylinder,
        "Electric": electric,
        "Kerosene": kerosene,
        "Coal": coal,
        "Wood": wood,
      };
}
