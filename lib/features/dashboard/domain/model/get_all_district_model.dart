// To parse this JSON data, do
//
//     final getAllDistrictModel = getAllDistrictModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetAllDistrictModel> getAllDistrictModelFromJson(String str) =>
    List<GetAllDistrictModel>.from(
        json.decode(str).map((x) => GetAllDistrictModel.fromJson(x)));

String getAllDistrictModelToJson(List<GetAllDistrictModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllDistrictModel {
  final String? id;
  final String? districtName;
  final String? status;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? approvalStatus;
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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        approvalStatus: json["approval_status"],
        approvalDate: json["approval_date"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_name": districtName,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
        "approval_status": approvalStatus,
        "approval_date": approvalDate,
        "remarks": remarks,
      };
  @override
  String toString() {
    // TODO: implement toString
    return districtName!;
  }
}
