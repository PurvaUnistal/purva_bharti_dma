// To parse this JSON data, do
//
//     final getDmaByPhoneNumberModel = getDmaByPhoneNumberModelFromJson(jsonString);

import 'dart:convert';

GetDmaByPhoneNumberModel getDmaByPhoneNumberModelFromJson(String str) =>
    GetDmaByPhoneNumberModel.fromJson(json.decode(str));

String getDmaByPhoneNumberModelToJson(GetDmaByPhoneNumberModel data) =>
    json.encode(data.toJson());

class GetDmaByPhoneNumberModel {
  final int status;
  final List<AllDMAFormData> data;

  GetDmaByPhoneNumberModel({
    this.status,
    this.data,
  });

  factory GetDmaByPhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      GetDmaByPhoneNumberModel(
        status: json["status"] ?? " ",
        data: List<AllDMAFormData>.from(
            json["data"].map((x) => AllDMAFormData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllDMAFormData {
  final Info info;
  final Kyc kyc;
  final CustomerPhoto customerPhoto;
  final CustomerConsent customerConsent;
  final Deposit deposit;
  final Approval approval;

  AllDMAFormData({
    this.info,
    this.kyc,
    this.customerPhoto,
    this.customerConsent,
    this.deposit,
    this.approval,
  });

  factory AllDMAFormData.fromJson(Map<String, dynamic> json) => AllDMAFormData(
        info: Info.fromJson(json["info"] ?? ""),
        kyc: Kyc.fromJson(json["kyc"] ?? ""),
        customerPhoto: CustomerPhoto.fromJson(json["customer_photo"] ?? ""),
        customerConsent: CustomerConsent.fromJson(json["customer_consent"] ?? ""),
        deposit: Deposit.fromJson(json["deposit"] ?? ""),
        approval: Approval.fromJson(json["approval"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "kyc": kyc.toJson(),
        "customer_photo": customerPhoto.toJson(),
        "customer_consent": customerConsent.toJson(),
        "deposit": deposit.toJson(),
        "approval": approval.toJson(),
      };
}

class Approval {
  final String marketingApproval;
  final DateTime markStatusTime;
  final dynamic marketingRejectReason;
  final String accountingApproval;
  final dynamic accountingTime;
  final dynamic accontingRejectReason;

  Approval({
    this.marketingApproval,
    this.markStatusTime,
    this.marketingRejectReason,
    this.accountingApproval,
    this.accountingTime,
    this.accontingRejectReason,
  });

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        marketingApproval: json["marketing_approval"] ?? "",
        markStatusTime: json["mark_status_time"] != null ? DateTime.parse(json["mark_status_time"]) : null,
        marketingRejectReason: json["marketing_reject_reason"] ?? "",
        accountingApproval: json["accounting_approval"] ?? "",
        accountingTime: json["accounting_time"] ?? "",
        accontingRejectReason: json["acconting_reject_reason"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "marketing_approval": marketingApproval,
        "mark_status_time": markStatusTime.toIso8601String(),
        "marketing_reject_reason": marketingRejectReason,
        "accounting_approval": accountingApproval,
        "accounting_time": accountingTime,
        "acconting_reject_reason": accontingRejectReason,
      };
}

class CustomerConsent {
  final String preferedBillingMode;
  final String nameOfBank;
  final String bankAccountNumber;
  final String bankIfscCode;
  final String bankAddress;
  final String acceptConversionPolicy;
  final String acceptExtraFittingCost;
  final String canceledCheque;
  final String customerConsent;

  CustomerConsent({
    this.preferedBillingMode,
    this.nameOfBank,
    this.bankAccountNumber,
    this.bankIfscCode,
    this.bankAddress,
    this.acceptConversionPolicy,
    this.acceptExtraFittingCost,
    this.canceledCheque,
    this.customerConsent,
  });

  factory CustomerConsent.fromJson(Map<String, dynamic> json) =>
      CustomerConsent(
        preferedBillingMode: json["prefered_billing_mode"] ?? "",
        nameOfBank: json["name_of_bank"] ?? "",
        bankAccountNumber: json["bank_account_number"] ?? "",
        bankIfscCode: json["bank_ifsc_code"] ?? "",
        bankAddress: json["bank_address"] ?? "",
        acceptConversionPolicy: json["accept_conversion_policy"] ?? "",
        acceptExtraFittingCost: json["accept_extra_fitting_cost"] ?? "",
        canceledCheque: json["canceled_cheque"] ?? "",
        customerConsent: json["customer_consent"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "prefered_billing_mode": preferedBillingMode,
        "name_of_bank": nameOfBank,
        "bank_account_number": bankAccountNumber,
        "bank_ifsc_code": bankIfscCode,
        "bank_address": bankAddress,
        "accept_conversion_policy": acceptConversionPolicy,
        "accept_extra_fitting_cost": acceptExtraFittingCost,
        "canceled_cheque": canceledCheque,
        "customer_consent": customerConsent,
      };
}

class CustomerPhoto {
  final String customerPhoto;
  final String housePhoto;

  CustomerPhoto({
    this.customerPhoto,
    this.housePhoto,
  });

  factory CustomerPhoto.fromJson(Map<String, dynamic> json) => CustomerPhoto(
        customerPhoto: json["customer_photo"] ?? "",
        housePhoto: json["house_photo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "customer_photo": customerPhoto,
        "house_photo": housePhoto,
      };
}

class Deposit {
  final String initialDepositeStatus;
  final String modeOfDeposite;
  final String depositeType;
  final String initialAmount;
  final DateTime initialDepositeDate;
  final String paymentBankName;
  final String chequeBankAccount;
  final String chequeNumber;
  final String chequePhoto;
  final dynamic depositSlipDate;
  final String depositSlip;

  Deposit({
    this.initialDepositeStatus,
    this.modeOfDeposite,
    this.depositeType,
    this.initialAmount,
    this.initialDepositeDate,
    this.paymentBankName,
    this.chequeBankAccount,
    this.chequeNumber,
    this.chequePhoto,
    this.depositSlipDate,
    this.depositSlip,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        initialDepositeStatus: json["initial_deposite_status"] ?? "",
        modeOfDeposite: json["mode_of_deposite"] ?? "",
        depositeType: json["deposite_type"] ?? "",
        initialAmount: json["initial_amount"] ?? "",
        initialDepositeDate: json["initial_deposite_date"] != null ? DateTime.parse(json["initial_deposite_date"]) : null,
        paymentBankName: json["payment_bank_name"] ?? "",
        chequeBankAccount: json["cheque_bank_account"] ?? "",
        chequeNumber: json["cheque_number"] ?? "",
        chequePhoto: json["cheque_photo"] ?? "",
        depositSlipDate: json["deposit_slip_date"] ?? "",
        depositSlip: json["deposit_slip"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "initial_deposite_status": initialDepositeStatus,
        "mode_of_deposite": modeOfDeposite,
        "deposite_type": depositeType,
        "initial_amount": initialAmount,
        "initial_deposite_date":
            "${initialDepositeDate.year.toString().padLeft(4, '0')}-${initialDepositeDate.month.toString().padLeft(2, '0')}-${initialDepositeDate.day.toString().padLeft(2, '0')}",
        "payment_bank_name": paymentBankName,
        "cheque_bank_account": chequeBankAccount,
        "cheque_number": chequeNumber,
        "cheque_photo": chequePhoto,
        "deposit_slip_date": depositSlipDate,
        "deposit_slip": depositSlip,
      };
}

class Info {
  final String firstName;
  final String dmaFormStatus;
  final bool depositEnabled;
  final String crn;
  final String id;
  final String lastName;
  final String interested;
  final String mobileNumber;

  Info({
    this.firstName,
    this.dmaFormStatus,
    this.depositEnabled,
    this.crn,
    this.id,
    this.lastName,
    this.interested,
    this.mobileNumber,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        firstName: json["first_name"] ?? "",
        dmaFormStatus: json["dma_form_status"] ?? "",
        depositEnabled: json["deposit_enabled"] ?? "",
        crn: json["crn"] ?? "",
        id: json["id"] ?? "",
        lastName: json["last_name"] ?? "",
        interested: json["interested"] ?? "",
        mobileNumber: json["mobile_number"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "dma_form_status": dmaFormStatus,
        "deposit_enabled": depositEnabled,
        "crn": crn,
        "id": id,
        "last_name": lastName,
        "interested": interested,
        "mobile_number": mobileNumber,
      };
}

class Kyc {
  final String areaId;
  final String areaName;
  final String guardianName;
  final String emailId;
  final String propName;
  final String propertyCategoryId;
  final String propertyClassId;
  final String propClass;
  final String identificationProof;
  final String identificationProofNumber;
  final String identificationFrontImage;
  final String identificationBackImage;
  final String ownershipProof;
  final String ownershipProofNumber;
  final String ownershipFrontImage;
  final String ownershipBackImage;
  final String kycDoc3;
  final String kycDoc3Number;
  final String kycDoc3FrontImage;
  final String kycDoc3BackImage;
  final String houseNumber;
  final String locality;
  final String town;
  final String pinCode;
  final dynamic district;
  final dynamic states;
  final String societyAllowedMdpe;
  final String residentStatus;
  final String noOfKitchen;
  final String noOfBathroom;
  final String existingCookingFuel;
  final String noOfFamilyMembers;
  final String longitude;
  final String latitude;
  final String remarks;

  Kyc({
    this.areaId,
    this.areaName,
    this.guardianName,
    this.emailId,
    this.propName,
    this.propertyCategoryId,
    this.propertyClassId,
    this.propClass,
    this.identificationProof,
    this.identificationProofNumber,
    this.identificationFrontImage,
    this.identificationBackImage,
    this.ownershipProof,
    this.ownershipProofNumber,
    this.ownershipFrontImage,
    this.ownershipBackImage,
    this.kycDoc3,
    this.kycDoc3Number,
    this.kycDoc3FrontImage,
    this.kycDoc3BackImage,
    this.houseNumber,
    this.locality,
    this.town,
    this.pinCode,
    this.district,
    this.states,
    this.societyAllowedMdpe,
    this.residentStatus,
    this.noOfKitchen,
    this.noOfBathroom,
    this.existingCookingFuel,
    this.noOfFamilyMembers,
    this.longitude,
    this.latitude,
    this.remarks,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
        areaId: json["area_id"] ?? " ",
        areaName: json["area_name"] ?? " ",
        guardianName: json["guardian_name"] ?? " ",
        emailId: json["email_id"] ?? " ",
        propName: json["prop_name"] ?? " ",
        propertyCategoryId: json["property_category_id"] ?? " ",
        propertyClassId: json["property_class_id"] ?? " ",
        propClass: json["prop_class"] ?? " ",
        identificationProof: json["identification_proof"] ?? " ",
        identificationProofNumber: json["identification_proof_number"] ?? " ",
        identificationFrontImage: json["identification_front_image"] ?? " ",
        identificationBackImage: json["identification_back_image"] ?? " ",
        ownershipProof: json["ownership_proof"] ?? " ",
        ownershipProofNumber: json["ownership_proof_number"] ?? " ",
        ownershipFrontImage: json["ownership_front_image"] ?? " ",
        ownershipBackImage: json["ownership_back_image"] ?? " ",
        kycDoc3: json["kyc_doc3"] ?? " ",
        kycDoc3Number: json["kyc_doc3_number"] ?? " ",
        kycDoc3FrontImage: json["kyc_doc3_front_image"] ?? " ",
        kycDoc3BackImage: json["kyc_doc3_back_image"] ?? " ",
        houseNumber: json["house_number"] ?? " ",
        locality: json["locality"] ?? " ",
        town: json["town"] ?? " ",
        pinCode: json["pin_code"] ?? " ",
        district: json["district"] ?? " ",
        states: json["states"] ?? " ",
        societyAllowedMdpe: json["society_allowed_mdpe"] ?? " ",
        residentStatus: json["resident_status"] ?? " ",
        noOfKitchen: json["no_of_kitchen"] ?? " ",
        noOfBathroom: json["no_of_bathroom"] ?? " ",
        existingCookingFuel: json["existing_cooking_fuel"] ?? " ",
        noOfFamilyMembers: json["no_of_family_members"] ?? " ",
        longitude: json["longitude"] ?? " ",
        latitude: json["latitude"] ?? " ",
        remarks: json["remarks"] ?? " ",
      );

  Map<String, dynamic> toJson() => {
        "area_id": areaId,
        "area_name": areaName,
        "guardian_name": guardianName,
        "email_id": emailId,
        "prop_name": propName,
        "property_category_id": propertyCategoryId,
        "property_class_id": propertyClassId,
        "prop_class": propClass,
        "identification_proof": identificationProof,
        "identification_proof_number": identificationProofNumber,
        "identification_front_image": identificationFrontImage,
        "identification_back_image": identificationBackImage,
        "ownership_proof": ownershipProof,
        "ownership_proof_number": ownershipProofNumber,
        "ownership_front_image": ownershipFrontImage,
        "ownership_back_image": ownershipBackImage,
        "kyc_doc3": kycDoc3,
        "kyc_doc3_number": kycDoc3Number,
        "kyc_doc3_front_image": kycDoc3FrontImage,
        "kyc_doc3_back_image": kycDoc3BackImage,
        "house_number": houseNumber,
        "locality": locality,
        "town": town,
        "pin_code": pinCode,
        "district": district,
        "states": states,
        "society_allowed_mdpe": societyAllowedMdpe,
        "resident_status": residentStatus,
        "no_of_kitchen": noOfKitchen,
        "no_of_bathroom": noOfBathroom,
        "existing_cooking_fuel": existingCookingFuel,
        "no_of_family_members": noOfFamilyMembers,
        "longitude": longitude,
        "latitude": latitude,
        "remarks": remarks,
      };
}
