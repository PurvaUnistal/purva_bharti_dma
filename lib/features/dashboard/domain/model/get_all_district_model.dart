// To parse this JSON data, do
//
//      getAllDistrictModel = getAllDistrictModelFromJson(jsonString);

import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_all_district_model.g.dart';

List<GetAllDistrictModel> getAllDistrictModelFromJson(String str) =>
    List<GetAllDistrictModel>.from(
        json.decode(str).map((x) => GetAllDistrictModel.fromJson(x)));

String getAllDistrictModelToJson(List<GetAllDistrictModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetAllDistrictId)

class GetAllDistrictModel {
  @HiveField(0)
   String? id;
  @HiveField(1)
   String? districtName;
  @HiveField(2)
   String? status;
  @HiveField(3)
   DateTime? createdAt;
  @HiveField(4)
   dynamic updatedAt;
  @HiveField(5)
   String? approvalStatus;
  @HiveField(6)
   dynamic approvalDate;
  @HiveField(7)
   dynamic remarks;

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
        id: json["id"]?? "",
        districtName: json["district_name"]?? "",
        status: json["status"]?? "",
        createdAt: json["created_at"] == null ?  null: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"]?? "",
        approvalStatus: json["approval_status"]?? "",
        approvalDate: json["approval_date"]?? "",
        remarks: json["remarks"]?? "",
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
    return districtName.toString();
  }
}
