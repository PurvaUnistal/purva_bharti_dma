// To parse this JSON data, do
//
//     final getAllAreaModel = getAllAreaModelFromJson(jsonString);

import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_all_area_model.g.dart';

List<GetAllAreaModel> getAllAreaModelFromJson(String str) =>
    List<GetAllAreaModel>.from(
        json.decode(str).map((x) => GetAllAreaModel.fromJson(x)));

String getAllAreaModelToJson(List<GetAllAreaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetAllAreaId)

class GetAllAreaModel {
  @HiveField(0)
  final String? gid;
  @HiveField(1)
  final dynamic objectid;
  @HiveField(2)
  final String? areaName;
  @HiveField(3)
  final dynamic shapeLeng;
  @HiveField(4)
  final String? areacode;
  @HiveField(5)
  final dynamic cityId;
  @HiveField(6)
  final String? chargeAreaId;
  @HiveField(7)
  final dynamic subareacod;
  @HiveField(8)
  final dynamic shapeLe1;
  @HiveField(9)
  final dynamic shapeArea;
  @HiveField(10)
  final String? readyForConnection;

  GetAllAreaModel({
    this.gid,
    this.objectid,
    this.areaName,
    this.shapeLeng,
    this.areacode,
    this.cityId,
    this.chargeAreaId,
    this.subareacod,
    this.shapeLe1,
    this.shapeArea,
    this.readyForConnection,
  });

  factory GetAllAreaModel.fromJson(Map<String, dynamic> json) =>
      GetAllAreaModel(
        gid: json["gid"],
        objectid: json["objectid"],
        areaName: json["area_name"],
        shapeLeng: json["shape_leng"],
        areacode: json["areacode"],
        cityId: json["city_id"],
        chargeAreaId: json["charge_area_id"],
        subareacod: json["subareacod"],
        shapeLe1: json["shape_le_1"],
        shapeArea: json["shape_area"],
        readyForConnection: json["ready_for_connection"],
      );

  Map<String, dynamic> toJson() => {
        "gid": gid,
        "objectid": objectid,
        "area_name": areaName,
        "shape_leng": shapeLeng,
        "areacode": areacode,
        "city_id": cityId,
        "charge_area_id": chargeAreaId,
        "subareacod": subareacod,
        "shape_le_1": shapeLe1,
        "shape_area": shapeArea,
        "ready_for_connection": readyForConnection,
      };
  @override
  String toString() {
    // TODO: implement toString
    return areaName!;
  }
}
