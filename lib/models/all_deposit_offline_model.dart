// To parse this JSON data, do
//
//     final allDepositOfflineModel = allDepositOfflineModelFromJson(jsonString);

import 'dart:convert';

List<AllDepositOfflineModel> allDepositOfflineModelFromJson(String str) => List<AllDepositOfflineModel>.from(json.decode(str).map((x) => AllDepositOfflineModel.fromJson(x)));

String allDepositOfflineModelToJson(List<AllDepositOfflineModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllDepositOfflineModel {
  String? depositTypesId;
  String? depositName;
  String? depositAmount;
  String? status;
  int? schemeMonth;
  String? schemeType;
  DateTime? dateFrom;
  dynamic dateTo;
  String? schemeCode;
  int? gasDepositAmount;
  String? equipmentDepositAmount;
  String? interestAmount;
  dynamic createdAt;
  dynamic updatedAt;
  String? rejectComments;
  String? customerCount;
  String? registrationGst;
  dynamic interestTax;
  String? rebateId;
  String? totalAmount;
  int? firstDepositAmount;
  String? nextCycleAmount;
  String? totalAmountWith;
  String? firstDepositAmountWith;
  String? depositAmountExcludingTaxWith;
  String? registrationGstWith;
  String? depositAmountWith;
  String? benifitApplicable;
  String? equipmentIncludeInBill;
  String? registrationRefunded;
  String? equipmentRefunded;
  String? gasRefunded;
  String? approvalStatus;
  DateTime? approvalDate;
  String? depositTaxPer;
  dynamic interestTaxPer;
  String? registrationTaxName;
  dynamic interestTaxName;
  int? remainingCount;
  int? allDepositOfflineModelTotalAmount;
  String? interestTaxAmt;
  String? regTax;

  AllDepositOfflineModel({
    this.depositTypesId,
    this.depositName,
    this.depositAmount,
    this.status,
    this.schemeMonth,
    this.schemeType,
    this.dateFrom,
    this.dateTo,
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
    this.allDepositOfflineModelTotalAmount,
    this.interestTaxAmt,
    this.regTax,
  });

  factory AllDepositOfflineModel.fromJson(Map<String, dynamic> json) => AllDepositOfflineModel(
        depositTypesId: json["deposit_types_id"],
        depositName: json["deposit_name"],
        depositAmount: json["deposit_amount"],
        status: json["status"],
        schemeMonth: json["scheme_month"],
        schemeType: json["scheme_type"],
        dateFrom: DateTime.parse(json["date_from"]),
        dateTo: json["date_to"],
        schemeCode: json["scheme_code"],
        gasDepositAmount: json["gas_deposit_amount"],
        equipmentDepositAmount: json["equipment_deposit_amount"],
        interestAmount: json["interest_amount"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        rejectComments: json["reject_comments"],
        customerCount: json["customer_count"],
        registrationGst: json["registration_gst"],
        interestTax: json["interest_tax"],
        rebateId: json["rebate_id"],
        totalAmount: json["totalAmount"],
        firstDepositAmount: json["firstDepositAmount"],
        nextCycleAmount: json["nextCycleAmount"],
        totalAmountWith: json["totalAmountWith"],
        firstDepositAmountWith: json["firstDepositAmountWith"],
        depositAmountExcludingTaxWith: json["deposit_amount_excluding_tax_with"],
        registrationGstWith: json["registration_gst_with"],
        depositAmountWith: json["deposit_amount_with"],
        benifitApplicable: json["benifit_applicable"],
        equipmentIncludeInBill: json["equipment_include_in_bill"],
        registrationRefunded: json["registration_refunded"],
        equipmentRefunded: json["equipment_refunded"],
        gasRefunded: json["gas_refunded"],
        approvalStatus: json["approval_status"],
        approvalDate: DateTime.parse(json["approval_date"]),
        depositTaxPer: json["deposit_tax_per"],
        interestTaxPer: json["interest_tax_per"],
        registrationTaxName: json["registration_tax_name"],
        interestTaxName: json["interest_tax_name"],
        remainingCount: json["remainingCount"],
        allDepositOfflineModelTotalAmount: json["total_amount"],
        interestTaxAmt: json["interest_tax_amt"],
        regTax: json["reg_tax"],
      );

  Map<String, dynamic> toJson() => {
        "deposit_types_id": depositTypesId,
        "deposit_name": depositName,
        "deposit_amount": depositAmount,
        "status": status,
        "scheme_month": schemeMonth,
        "scheme_type": schemeType,
        "date_from": "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
        "date_to": dateTo,
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
        "total_amount": allDepositOfflineModelTotalAmount,
        "interest_tax_amt": interestTaxAmt,
        "reg_tax": regTax,
      };
}
