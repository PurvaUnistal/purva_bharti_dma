// To parse this JSON data, do
//
//     final getExistingCookingFuelModel = getExistingCookingFuelModelFromJson(jsonString);

import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_existing_cooking_fuel_model.g.dart';


GetExistingCookingFuelModel getExistingCookingFuelModelFromJson(String str) => GetExistingCookingFuelModel.fromJson(json.decode(str));

String getExistingCookingFuelModelToJson(GetExistingCookingFuelModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeId.GetCookingFuelId)

class GetExistingCookingFuelModel {
  @HiveField(0)
  final String? key;
  @HiveField(1)
  final String? value;

  GetExistingCookingFuelModel({
    this.key,
    this.value,
  });

  factory GetExistingCookingFuelModel.fromJson(Map<String, dynamic> json) => GetExistingCookingFuelModel(
        key: json["key"],
        value: json["value"],
      );

  static List<GetExistingCookingFuelModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetExistingCookingFuelModel(key: e.key, value: e.value)).toList();
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
