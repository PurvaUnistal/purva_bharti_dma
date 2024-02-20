// To parse this JSON data, do
//
//     final chargeAreaModel = chargeAreaModelFromJson(jsonString);

import 'dart:convert';

List<ChargeAreaModel> chargeAreaModelFromJson(String str) =>
    List<ChargeAreaModel>.from(
        json.decode(str).map((x) => ChargeAreaModel.fromJson(x)));

String chargeAreaModelToJson(List<ChargeAreaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChargeAreaModel {
  ChargeAreaModel({
    required this.gid,
    required this.chargeAreaCode,
    required this.projectId,
    required this.objectid,
    required this.shapeLeng,
    required this.shapeArea,
    required this.chargeAreaName,
  });

  String gid;
  String chargeAreaCode;
  String projectId;
  String objectid;
  String shapeLeng;
  String shapeArea;
  String chargeAreaName;

  factory ChargeAreaModel.fromJson(Map<String, dynamic> json) =>
      ChargeAreaModel(
        gid: json["gid"] ?? "",
        chargeAreaCode: json["charge_area_code"] ?? "",
        projectId: json["project_id"] ?? "",
        objectid: json["objectid"] ?? "",
        shapeLeng: json["shape_leng"] ?? "",
        shapeArea: json["shape_area"] ?? "",
        chargeAreaName: json["charge_area_name"] ?? "",
      );
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['gid'] = this.gid;
  //   data['charge_area_code'] = this.chargeAreaCode;
  //   data['project_id'] = this.projectId;
  //   data['objectid'] = this.objectid;
  //   data['shape_leng'] = this.shapeLeng;
  //   data['shape_area'] = this.shapeArea;
  //   data['charge_area_name'] = this.chargeAreaName;
  //   return data;
  // }
  Map<String, dynamic> toJson() => {
        "gid": gid,
        "charge_area_code": chargeAreaCode,
        "project_id": projectId,
        "objectid": objectid,
        "shape_leng": shapeLeng,
        "shape_area": shapeArea,
        "charge_area_name": chargeAreaName,
      };
}
