// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

List<AreaModel> areaModelFromJson(String str) =>
    List<AreaModel>.from(json.decode(str).map((x) => AreaModel.fromJson(x)));

String areaModelToJson(List<AreaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AreaModel {
  final String gid;
  final dynamic objectid;
  final String areaName;
  final dynamic shapeLeng;
  final String areacode;
  final dynamic cityId;
  final String chargeAreaId;
  final dynamic subareacod;
  final dynamic shapeLe1;
  final dynamic shapeArea;
  final String readyForConnection;

  AreaModel({
    required this.gid,
    required this.objectid,
    required this.areaName,
    required this.shapeLeng,
    required this.areacode,
    required this.cityId,
    required this.chargeAreaId,
    required this.subareacod,
    required this.shapeLe1,
    required this.shapeArea,
    required this.readyForConnection,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
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
}
