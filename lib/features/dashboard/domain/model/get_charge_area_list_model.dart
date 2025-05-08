// To parse this JSON data, do
//
//      getChargeAreaListModel = getChargeAreaListModelFromJson(jsonString);

import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_charge_area_list_model.g.dart';

List<GetChargeAreaListModel> getChargeAreaListModelFromJson(String str) =>
    List<GetChargeAreaListModel>.from(
        json.decode(str).map((x) => GetChargeAreaListModel.fromJson(x)));

String getChargeAreaListModelToJson(List<GetChargeAreaListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetChargeAreaListId)

class GetChargeAreaListModel {
  @HiveField(0)
  String? gid;
  @HiveField(1)
   String? chargeAreaCode;
  @HiveField(2)
   String? projectId;
  @HiveField(3)
   dynamic objectid;
  @HiveField(4)
   dynamic shapeLeng;
  @HiveField(5)
   dynamic shapeArea;
  @HiveField(6)
   String? chargeAreaName;
  @HiveField(7)
   dynamic billingType;

  GetChargeAreaListModel({
    this.gid,
    this.chargeAreaCode,
    this.projectId,
    this.objectid,
    this.shapeLeng,
    this.shapeArea,
    this.chargeAreaName,
    this.billingType,
  });

  factory GetChargeAreaListModel.fromJson(Map<String, dynamic> json) =>
      GetChargeAreaListModel(
        gid: json["gid"] ?? "",
        chargeAreaCode: json["charge_area_code"] ?? "",
        projectId: json["project_id"] ?? "",
        objectid: json["objectid"] ?? "",
        shapeLeng: json["shape_leng"] ?? "",
        shapeArea: json["shape_area"] ?? "",
        chargeAreaName: json["charge_area_name"] ?? "",
        billingType: json["billing_type"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "gid": gid,
        "charge_area_code": chargeAreaCode,
        "project_id": projectId,
        "objectid": objectid,
        "shape_leng": shapeLeng,
        "shape_area": shapeArea,
        "charge_area_name": chargeAreaName,
        "billing_type": billingType,
      };
  @override
  String toString() {
    // TODO: implement toString
    return chargeAreaName.toString();
  }
}
