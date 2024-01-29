// To parse this JSON data, do
//
//     final getAllDistrictModel = getAllDistrictModelFromJson(jsonString);

import 'dart:convert';

List<GetAllDistrictModel> getAllDistrictModelFromJson(String str) =>
    List<GetAllDistrictModel>.from(
        jsonDecode(str).map((x) => GetAllDistrictModel.fromJson(x)));

String getAllDistrictModelToJson(List<GetAllDistrictModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllDistrictModel {
  final String id;
  final String districtName;
  final String status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic approvalStatus;
  final dynamic approvalDate;
  final dynamic remarks;

  GetAllDistrictModel({
    this.id,
    this.districtName,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.approvalStatus,
    this.approvalDate,
    this.remarks,
  });

  factory GetAllDistrictModel.fromJson(Map<String, dynamic> json) =>
      GetAllDistrictModel(
        id: json["id"],
        districtName: json["district_name"],
        status: json["status"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : "",
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : "",
        approvalStatus:
            json["approval_status"] != null ? json["approval_status"] : "",
        approvalDate:
            json["approval_date"] != null ? json["approval_date"] : "",
        remarks: json["remarks"] != null ? json["remarks"] : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_name": districtName,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "approval_status": approvalStatus,
        "approval_date": approvalDate,
        "remarks": remarks,
      };
}
