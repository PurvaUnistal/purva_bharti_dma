// To parse this JSON data, do
//
//     final getAllDepositOfflineModel = getAllDepositOfflineModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<GetAllDepositOfflineModel> getAllDepositOfflineModelFromJson(String str) =>
    List<GetAllDepositOfflineModel>.from(
        json.decode(str).map((x) => GetAllDepositOfflineModel.fromJson(x)));

String getAllDepositOfflineModelToJson(List<GetAllDepositOfflineModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllDepositOfflineModel {
  final String? depositTypesId;
  final String? depositName;
  final String? depositAmount;
  final String? status;
  final int? schemeMonth;
  final String? schemeType;
  final DateTime? dateFrom;
  final dynamic dateTo;
  final String? schemeCode;
  final int? gasDepositAmount;
  final String? equipmentDepositAmount;
  final String? interestAmount;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic rejectComments;
  final String? customerCount;
  final String? registrationGst;
  final dynamic interestTax;
  final String? rebateId;
  final String? totalAmount;
  final int? firstDepositAmount;
  final String? nextCycleAmount;
  final String? totalAmountWith;
  final String? firstDepositAmountWith;
  final String? depositAmountExcludingTaxWith;
  final String? registrationGstWith;
  final String? depositAmountWith;
  final String? benifitApplicable;
  final String? equipmentIncludeInBill;
  final String? registrationRefunded;
  final String? equipmentRefunded;
  final String? gasRefunded;
  final String? approvalStatus;
  final DateTime? approvalDate;
  final String? depositTaxPer;
  final dynamic interestTaxPer;
  final String? registrationTaxName;
  final dynamic interestTaxName;
  final int? remainingCount;
  final int? getAllDepositOfflineModelTotalAmount;
  final String? interestTaxAmt;
  final String? regTax;

  GetAllDepositOfflineModel({
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
     this.getAllDepositOfflineModelTotalAmount,
     this.interestTaxAmt,
     this.regTax,
  });

  factory GetAllDepositOfflineModel.fromJson(Map<String, dynamic> json) =>
      GetAllDepositOfflineModel(
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
        depositAmountExcludingTaxWith:
            json["deposit_amount_excluding_tax_with"],
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
        getAllDepositOfflineModelTotalAmount: json["total_amount"],
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
        "date_from":
            "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
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
        "total_amount": getAllDepositOfflineModelTotalAmount,
        "interest_tax_amt": interestTaxAmt,
        "reg_tax": regTax,
      };

  @override
  String toString() {
    // TODO: implement toString
    return depositName!;
  }
}
