import 'dart:convert';
List<ChargeAreaModel> getChargeAreaModelFromJson(String str) =>
    List<ChargeAreaModel>.from(
        json.decode(str).map((x) => ChargeAreaModel.fromJson(x)));

String getChargeAreaModelToJson(List<ChargeAreaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChargeAreaModel {
  String gid;
  String chargeAreaCode;
  dynamic projectId;
  dynamic objectid;
  dynamic shapeLeng;
  dynamic shapeArea;
  String chargeAreaName;
  String charge_area_id;

  ChargeAreaModel({
    this.gid,
    this.chargeAreaCode,
    this.projectId,
    this.objectid,
    this.shapeLeng,
    this.shapeArea,
    this.chargeAreaName,
    this.charge_area_id,
  });


  factory ChargeAreaModel.fromJson(Map<String, dynamic> json) => ChargeAreaModel(
    gid: json["gid"] ?? "",
    chargeAreaCode: json["charge_area_code"] ?? "",
    projectId: json["project_id"] ?? "",
    objectid: json["objectid"] ?? "",
    shapeLeng: json["shape_leng"] ?? "",
    shapeArea: json["shape_area"] ?? "",
    chargeAreaName: json["charge_area_name"] ?? "",
    charge_area_id: json["charge_area_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "gid": gid,
    "charge_area_code": chargeAreaCode,
    "project_id": projectId,
    "objectid": objectid,
    "shape_leng": shapeLeng,
    "shape_area": shapeArea,
    "charge_area_name": chargeAreaName,
    "charge_area_id": charge_area_id,
  };
  @override
  String toString() {
    return chargeAreaName.toString();
  }
}
