class ScheemType {
  String depositTypesId;
  String depositName;
  String depositAmount;
  String status;
  int schemeMonth;
  String schemeType;
  String dateFrom;
  String dateTo;
  String schemeCode;
  int gasDepositAmount;
  String equipmentDepositAmount;
  String interestAmount;
  String createdAt;
  String updatedAt;
  String rejectComments;
  String customerCount;
  String registrationGst;
  String interestTax;
  String rebateId;
  String totalAmount;
  int firstDepositAmount;
  String nextCycleAmount;
  String totalAmountWith;
  String firstDepositAmountWith;
  String depositAmountExcludingTaxWith;
  String registrationGstWith;
  String depositAmountWith;
  String benifitApplicable;
  String equipmentIncludeInBill;
  String registrationRefunded;
  String equipmentRefunded;
  String gasRefunded;
  String approvalStatus;
  String approvalDate;
  String depositTaxPer;
  String interestTaxPer;
  String registrationTaxName;
  String interestTaxName;
  int remainingCount;

  String interestTaxAmt;
  String regTax;

  ScheemType(
      {this.depositTypesId,
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

        this.interestTaxAmt,
        this.regTax});

  ScheemType.fromJson(Map<String, dynamic> json) {
    depositTypesId = json['deposit_types_id'];
    depositName = json['deposit_name'];
    depositAmount = json['deposit_amount'];
    status = json['status'];
    schemeMonth = json['scheme_month'];
    schemeType = json['scheme_type'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    schemeCode = json['scheme_code'];
    gasDepositAmount = json['gas_deposit_amount'];
    equipmentDepositAmount = json['equipment_deposit_amount'];
    interestAmount = json['interest_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rejectComments = json['reject_comments'];
    customerCount = json['customer_count'];
    registrationGst = json['registration_gst'];
    interestTax = json['interest_tax'];
    rebateId = json['rebate_id'];
    totalAmount = json['totalAmount'];
    firstDepositAmount = json['firstDepositAmount'];
    nextCycleAmount = json['nextCycleAmount'];
    totalAmountWith = json['totalAmountWith'];
    firstDepositAmountWith = json['firstDepositAmountWith'];
    depositAmountExcludingTaxWith = json['deposit_amount_excluding_tax_with'];
    registrationGstWith = json['registration_gst_with'];
    depositAmountWith = json['deposit_amount_with'];
    benifitApplicable = json['benifit_applicable'];
    equipmentIncludeInBill = json['equipment_include_in_bill'];
    registrationRefunded = json['registration_refunded'];
    equipmentRefunded = json['equipment_refunded'];
    gasRefunded = json['gas_refunded'];
    approvalStatus = json['approval_status'];
    approvalDate = json['approval_date'];
    depositTaxPer = json['deposit_tax_per'];
    interestTaxPer = json['interest_tax_per'];
    registrationTaxName = json['registration_tax_name'];
    interestTaxName = json['interest_tax_name'];
    remainingCount = json['remainingCount'];
    interestTaxAmt = json['interest_tax_amt'];
    regTax = json['reg_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deposit_types_id'] = this.depositTypesId;
    data['deposit_name'] = this.depositName;
    data['deposit_amount'] = this.depositAmount;
    data['status'] = this.status;
    data['scheme_month'] = this.schemeMonth;
    data['scheme_type'] = this.schemeType;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['scheme_code'] = this.schemeCode;
    data['gas_deposit_amount'] = this.gasDepositAmount;
    data['equipment_deposit_amount'] = this.equipmentDepositAmount;
    data['interest_amount'] = this.interestAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['reject_comments'] = this.rejectComments;
    data['customer_count'] = this.customerCount;
    data['registration_gst'] = this.registrationGst;
    data['interest_tax'] = this.interestTax;
    data['rebate_id'] = this.rebateId;
    data['totalAmount'] = this.totalAmount;
    data['firstDepositAmount'] = this.firstDepositAmount;
    data['nextCycleAmount'] = this.nextCycleAmount;
    data['totalAmountWith'] = this.totalAmountWith;
    data['firstDepositAmountWith'] = this.firstDepositAmountWith;
    data['deposit_amount_excluding_tax_with'] =
        this.depositAmountExcludingTaxWith;
    data['registration_gst_with'] = this.registrationGstWith;
    data['deposit_amount_with'] = this.depositAmountWith;
    data['benifit_applicable'] = this.benifitApplicable;
    data['equipment_include_in_bill'] = this.equipmentIncludeInBill;
    data['registration_refunded'] = this.registrationRefunded;
    data['equipment_refunded'] = this.equipmentRefunded;
    data['gas_refunded'] = this.gasRefunded;
    data['approval_status'] = this.approvalStatus;
    data['approval_date'] = this.approvalDate;
    data['deposit_tax_per'] = this.depositTaxPer;
    data['interest_tax_per'] = this.interestTaxPer;
    data['registration_tax_name'] = this.registrationTaxName;
    data['interest_tax_name'] = this.interestTaxName;
    data['remainingCount'] = this.remainingCount;

    data['interest_tax_amt'] = this.interestTaxAmt;
    data['reg_tax'] = this.regTax;
    return data;
  }
}