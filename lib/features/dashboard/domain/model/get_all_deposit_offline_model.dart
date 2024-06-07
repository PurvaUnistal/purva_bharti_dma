import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_all_deposit_offline_model.g.dart';

List<GetAllDepositOfflineModel> getAllDepositOfflineModelFromJson(String str) => List<GetAllDepositOfflineModel>.from(json.decode(str).map((x) => GetAllDepositOfflineModel.fromJson(x)));

String getAllDepositOfflineModelToJson(List<GetAllDepositOfflineModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@HiveType(typeId: HiveTypeId.GetAllDepositOfflineId)

class GetAllDepositOfflineModel {
  @HiveField(0)
  final String? depositTypesId;
  @HiveField(1)
  final String? depositName;
  @HiveField(2)
  final int? depositFree;
  @HiveField(3)
  final String? rentAmount;
  @HiveField(4)
  final String? depositAmount;
  @HiveField(5)
  final String? status;
  @HiveField(6)
  final int? schemeMonth;
  @HiveField(7)
  final String? schemeType;
  @HiveField(8)
  final DateTime? dateFrom;
  @HiveField(9)
  final dynamic dateTo;
  @HiveField(10)
  final int? depositAmountBeforeNgc;
  @HiveField(11)
  final String? schemeCode;
  @HiveField(12)
  final int? gasDepositAmount;
  @HiveField(13)
  final int? equipmentDepositAmount;
  @HiveField(14)
  final String? interestAmount;
  @HiveField(15)
  final dynamic createdAt;
  @HiveField(16)
  final dynamic updatedAt;
  @HiveField(17)
  final dynamic rejectComments;
  @HiveField(18)
  final String? customerCount;
  @HiveField(19)
  final String? registrationGst;
  @HiveField(20)
  final dynamic interestTax;
  @HiveField(21)
  final String? rebateId;
  @HiveField(22)
  final String? totalAmount;
  @HiveField(23)
  final String? firstDepositAmount;
  @HiveField(24)
  final String? nextCycleAmount;
  @HiveField(25)
  final String? totalAmountWith;
  @HiveField(26)
  final int? firstDepositAmountWith;
  @HiveField(27)
  final String? depositAmountExcludingTaxWith;
  @HiveField(28)
  final String? registrationGstWith;
  @HiveField(29)
  final String? depositAmountWith;
  @HiveField(30)
  final String? benifitApplicable;
  @HiveField(31)
  final String? equipmentIncludeInBill;
  @HiveField(32)
  final String? registrationRefunded;
  @HiveField(33)
  final String? equipmentRefunded;
  @HiveField(34)
  final String? gasRefunded;
  @HiveField(35)
  final String? approvalStatus;
  @HiveField(36)
  final DateTime? approvalDate;
  @HiveField(37)
  final String? depositTaxPer;
  @HiveField(38)
  final dynamic interestTaxPer;
  @HiveField(39)
  final String? registrationTaxName;
  @HiveField(40)
  final dynamic interestTaxName;
  @HiveField(41)
  final int? remainingCount;
  @HiveField(42)
  final String? propertyCategoryId;

  GetAllDepositOfflineModel({
     this.depositTypesId,
     this.depositName,
     this.depositFree,
     this.rentAmount,
     this.depositAmount,
     this.status,
     this.schemeMonth,
     this.schemeType,
     this.dateFrom,
     this.dateTo,
     this.depositAmountBeforeNgc,
     this.schemeCode,
     this.gasDepositAmount,
     this.equipmentDepositAmount,
     this.interestAmount,
     this.createdAt,
     this.updatedAt,
     this.rejectComments,
     this.customerCount,
     this.registrationGst,
     this.interestTax,
     this.rebateId,
     this.totalAmount,
     this.firstDepositAmount,
     this.nextCycleAmount,
     this.totalAmountWith,
     this.firstDepositAmountWith,
     this.depositAmountExcludingTaxWith,
     this.registrationGstWith,
     this.depositAmountWith,
     this.benifitApplicable,
     this.equipmentIncludeInBill,
     this.registrationRefunded,
     this.equipmentRefunded,
     this.gasRefunded,
     this.approvalStatus,
     this.approvalDate,
     this.depositTaxPer,
     this.interestTaxPer,
     this.registrationTaxName,
     this.interestTaxName,
     this.remainingCount,
     this.propertyCategoryId,
  });

  factory GetAllDepositOfflineModel.fromJson(Map<String, dynamic> json) => GetAllDepositOfflineModel(
    depositTypesId: json["deposit_types_id"] ?? "",
    depositName: json["deposit_name"] ?? "",
    depositFree: json["deposit_free"] ?? "",
    rentAmount: json["rent_amount"] ?? "",
    depositAmount: json["deposit_amount"] ?? "",
    status: json["status"] ?? "",
    schemeMonth: json["scheme_month"] ?? "",
    schemeType: json["scheme_type"] ?? "",
    dateFrom: json["date_from"] == null ? null : DateTime.parse(json["date_from"]),
    dateTo: json["date_to"] ?? "",
    depositAmountBeforeNgc: json["deposit_amount_before_ngc"] ?? "",
    schemeCode: json["scheme_code"] ?? "",
    gasDepositAmount: json["gas_deposit_amount"] ?? "",
    equipmentDepositAmount: json["equipment_deposit_amount"] ?? "",
    interestAmount: json["interest_amount"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
    rejectComments: json["reject_comments"] ?? "",
    customerCount: json["customer_count"] ?? "",
    registrationGst: json["registration_gst"] ?? "",
    interestTax: json["interest_tax"] ?? "",
    rebateId: json["rebate_id"] ?? "",
    totalAmount: json["totalAmount"] ?? "",
    firstDepositAmount: json["firstDepositAmount"] ?? "",
    nextCycleAmount: json["nextCycleAmount"] ?? "",
    totalAmountWith: json["totalAmountWith"] ?? "",
    firstDepositAmountWith: json["firstDepositAmountWith"] ?? "",
    depositAmountExcludingTaxWith: json["deposit_amount_excluding_tax_with"] ?? "",
    registrationGstWith: json["registration_gst_with"] ?? "",
    depositAmountWith: json["deposit_amount_with"] ?? "",
    benifitApplicable: json["benifit_applicable"] ?? "",
    equipmentIncludeInBill: json["equipment_include_in_bill"] ?? "",
    registrationRefunded: json["registration_refunded"] ?? "",
    equipmentRefunded: json["equipment_refunded"] ?? "",
    gasRefunded: json["gas_refunded"] ?? "",
    approvalStatus: json["approval_status"] ?? "",
    approvalDate: json["approval_date"] == null ? null : DateTime.parse(json["approval_date"]),
    depositTaxPer: json["deposit_tax_per"] ?? "",
    interestTaxPer: json["interest_tax_per"] ?? "",
    registrationTaxName: json["registration_tax_name"] ?? "",
    interestTaxName: json["interest_tax_name"] ?? "",
    remainingCount: json["remainingCount"] ?? "",
    propertyCategoryId: json["property_category_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "deposit_types_id": depositTypesId,
    "deposit_name": depositName,
    "deposit_free": depositFree,
    "rent_amount": rentAmount,
    "deposit_amount": depositAmount,
    "status": status,
    "scheme_month": schemeMonth,
    "scheme_type": schemeType,
    "date_from": "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
    "date_to": dateTo,
    "deposit_amount_before_ngc": depositAmountBeforeNgc,
    "scheme_code": schemeCode,
    "gas_deposit_amount": gasDepositAmount,
    "equipment_deposit_amount": equipmentDepositAmount,
    "interest_amount": interestAmount,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "reject_comments": rejectComments,
    "customer_count": customerCount,
    "registration_gst": registrationGst,
    "interest_tax": interestTax,
    "rebate_id": rebateId,
    "totalAmount": totalAmount,
    "firstDepositAmount": firstDepositAmount,
    "nextCycleAmount": nextCycleAmount,
    "totalAmountWith": totalAmountWith,
    "firstDepositAmountWith": firstDepositAmountWith,
    "deposit_amount_excluding_tax_with": depositAmountExcludingTaxWith,
    "registration_gst_with": registrationGstWith,
    "deposit_amount_with": depositAmountWith,
    "benifit_applicable": benifitApplicable,
    "equipment_include_in_bill": equipmentIncludeInBill,
    "registration_refunded": registrationRefunded,
    "equipment_refunded": equipmentRefunded,
    "gas_refunded": gasRefunded,
    "approval_status": approvalStatus,
    "approval_date": approvalDate!.toIso8601String(),
    "deposit_tax_per": depositTaxPer,
    "interest_tax_per": interestTaxPer,
    "registration_tax_name": registrationTaxName,
    "interest_tax_name": interestTaxName,
    "remainingCount": remainingCount,
    "property_category_id": propertyCategoryId,
  };

  @override
  String toString() {
    // TODO: implement toString
    return depositName.toString();
  }
}
