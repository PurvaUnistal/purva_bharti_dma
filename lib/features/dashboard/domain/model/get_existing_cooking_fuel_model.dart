// To parse this JSON data, do
//
//     final getExistingCookingFuelModel = getExistingCookingFuelModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_existing_cooking_fuel_model.g.dart';


GetExistingCookingFuelModel getExistingCookingFuelModelFromJson(String str) => GetExistingCookingFuelModel.fromJson(json.decode(str));

String getExistingCookingFuelModelToJson(GetExistingCookingFuelModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeId.GetCookingFuelId)

class GetExistingCookingFuelModel {
  @HiveField(0)
  final String? gasCylinder;
  @HiveField(1)
  final String? electric;
  @HiveField(2)
  final String? kerosene;
  @HiveField(3)
  final String? coal;
  @HiveField(5)
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
