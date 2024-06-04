// To parse this JSON data, do
//
//     final getGuardianTypeModel = getGuardianTypeModelFromJson(jsonString);

import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_guardian_type_model.g.dart';

GetGuardianTypeModel getGuardianTypeModelFromJson(String str) => GetGuardianTypeModel.fromJson(json.decode(str));

String getGuardianTypeModelToJson(GetGuardianTypeModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeId.GetGuardianTypeId)

class GetGuardianTypeModel {
  @HiveField(0)
  final String? key;
  @HiveField(1)
  final String? value;

  GetGuardianTypeModel({
    this.key,
    this.value,
  });

  factory GetGuardianTypeModel.fromJson(Map<String, dynamic> json) => GetGuardianTypeModel(
        key: json["key"],
        value: json["value"],
      );

  static List<GetGuardianTypeModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetGuardianTypeModel(key: e.key, value: e.value)).toList();
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
