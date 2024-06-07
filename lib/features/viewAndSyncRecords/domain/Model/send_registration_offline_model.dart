// To parse this JSON data, do
//
//     final sendRegistrationOfflineModel = sendRegistrationOfflineModelFromJson(jsonString);

import 'dart:convert';

SendRegistrationOfflineModel sendRegistrationOfflineModelFromJson(String str) => SendRegistrationOfflineModel.fromJson(json.decode(str));

String sendRegistrationOfflineModelToJson(SendRegistrationOfflineModel data) => json.encode(data.toJson());

class SendRegistrationOfflineModel {
  final int? success;
  final List<Message>? message;

  SendRegistrationOfflineModel({
    this.success,
    this.message,
  });

  factory SendRegistrationOfflineModel.fromJson(Map<String, dynamic> json) => SendRegistrationOfflineModel(
    success: json["success"] ?? "",
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class Message {
  final ListOfData? data;
  final String? message;

  Message({
    this.data,
    this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    data: ListOfData.fromJson(json["data"]),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "message": message,
  };
}

class ListOfData {
  final String? chequePhoto;
  final String? chequeBankAccount;
  final dynamic crn;
  final String? firstName;
  final String? lastName;
  final String? dmaUserName;
  final String? guardianType;
  final int? marketingApproval;
  final dynamic markStatusTime;
  final dynamic marketingRejectReason;
  final String? dmaUserId;
  final DateTime? dateOfRegistration;
  final String? customerPhoto;
  final String? housePhoto;
  final String? ownerConsent;
  final String? customerConsent;
  final String? backside1;
  final String? backside2;
  final String? canceledCheque;
  final String? backside3;
  final String? acceptConversionPolicy;
  final String? acceptExtraFittingCost;
  final String? kycDocument1Image;
  final String? kycDocument2Image;
  final String? kycDocument3Image;
  final String? districtId;
  final String? modeOfDeposite;
  final String? dmaDirPath;
  final String? schema;
  final String? interested;
  final String? areaId;
  final String? mobileNumber;
  final String? middleName;
  final String? guardianName;
  final String? emailId;
  final String? propertyCategoryId;
  final String? propertyClassId;
  final String? buildingNumber;
  final String? houseNumber;
  final String? locality;
  final String? address2;
  final String? town;
  final String? pinCode;
  final String? societyAllowedMdpe;
  final String? residentStatus;
  final String? noOfBathroom;
  final String? noOfKitchen;
  final String? existingCookingFuel;
  final String? noOfFamilyMembers;
  final String? latitude;
  final String? longitude;
  final String? remarks;
  final String? kycDocument1;
  final String? kycDocument1Number;
  final String? kycDocument2;
  final String? kycDocument2Number;
  final String? kycDocument3;
  final String? kycDocument3Number;
  final String? nameOfBank;
  final String? bankAccountNumber;
  final String? bankIfscCode;
  final String? bankAddress;
  final String? initialDepositeStatus;
  final String? reasonForHold;
  final String? depositeType;
  final String? initialAmount;
  final String? chequeNumber;
  final String? payementBankName;
  final String? micr;
  final String? documentUploads1;
  final String? documentUploads2;
  final String? documentUploads3;
  final String? uploadCustomerPhoto;
  final String? uploadHousePhoto;
  final int? id;

  ListOfData({
    this.chequePhoto,
    this.chequeBankAccount,
    this.crn,
    this.firstName,
    this.lastName,
    this.dmaUserName,
    this.guardianType,
    this.marketingApproval,
    this.markStatusTime,
    this.marketingRejectReason,
    this.dmaUserId,
    this.dateOfRegistration,
    this.customerPhoto,
    this.housePhoto,
    this.ownerConsent,
    this.customerConsent,
    this.backside1,
    this.backside2,
    this.canceledCheque,
    this.backside3,
    this.acceptConversionPolicy,
    this.acceptExtraFittingCost,
    this.kycDocument1Image,
    this.kycDocument2Image,
    this.kycDocument3Image,
    this.districtId,
    this.modeOfDeposite,
    this.dmaDirPath,
    this.schema,
    this.interested,
    this.areaId,
    this.mobileNumber,
    this.middleName,
    this.guardianName,
    this.emailId,
    this.propertyCategoryId,
    this.propertyClassId,
    this.buildingNumber,
    this.houseNumber,
    this.locality,
    this.address2,
    this.town,
    this.pinCode,
    this.societyAllowedMdpe,
    this.residentStatus,
    this.noOfBathroom,
    this.noOfKitchen,
    this.existingCookingFuel,
    this.noOfFamilyMembers,
    this.latitude,
    this.longitude,
    this.remarks,
    this.kycDocument1,
    this.kycDocument1Number,
    this.kycDocument2,
    this.kycDocument2Number,
    this.kycDocument3,
    this.kycDocument3Number,
    this.nameOfBank,
    this.bankAccountNumber,
    this.bankIfscCode,
    this.bankAddress,
    this.initialDepositeStatus,
    this.reasonForHold,
    this.depositeType,
    this.initialAmount,
    this.chequeNumber,
    this.payementBankName,
    this.micr,
    this.documentUploads1,
    this.documentUploads2,
    this.documentUploads3,
    this.uploadCustomerPhoto,
    this.uploadHousePhoto,
    this.id,
  });

  factory ListOfData.fromJson(Map<String, dynamic> json) => ListOfData(
    chequePhoto: json["cheque_photo"] ?? "",
    chequeBankAccount: json["cheque_bank_account"] ?? "",
    crn: json["crn"] ?? "",
    firstName: json["first_name"] ?? "",
    lastName: json["last_name"] ?? "",
    dmaUserName: json["dma_user_name"] ?? "",
    guardianType: json["guardian_type"] ?? "",
    marketingApproval: json["marketing_approval"] ?? "",
    markStatusTime: json["mark_status_time"] ?? "",
    marketingRejectReason: json["marketing_reject_reason"] ?? "",
    dmaUserId: json["dma_user_id"] ?? "",
    dateOfRegistration: DateTime.parse(json["date_of_registration"]),
    customerPhoto: json["customer_photo"] ?? "",
    housePhoto: json["house_photo"] ?? "",
    ownerConsent: json["owner_consent"] ?? "",
    customerConsent: json["customer_consent"] ?? "",
    backside1: json["backside1"] ?? "",
    backside2: json["backside2"] ?? "",
    canceledCheque: json["canceled_cheque"] ?? "",
    backside3: json["backside3"] ?? "",
    acceptConversionPolicy: json["accept_conversion_policy"] ?? "",
    acceptExtraFittingCost: json["accept_extra_fitting_cost"] ?? "",
    kycDocument1Image: json["kyc_document_1_image"] ?? "",
    kycDocument2Image: json["kyc_document_2_image"] ?? "",
    kycDocument3Image: json["kyc_document_3_image"] ?? "",
    districtId: json["district_id"] ?? "",
    modeOfDeposite: json["mode_of_deposite"] ?? "",
    dmaDirPath: json["dma_dir_path"] ?? "",
    schema: json["schema"] ?? "",
    interested: json["interested"] ?? "",
    areaId: json["area_id"] ?? "",
    mobileNumber: json["mobile_number"] ?? "",
    middleName: json["middle_name"] ?? "",
    guardianName: json["guardian_name"] ?? "",
    emailId: json["email_id"] ?? "",
    propertyCategoryId: json["property_category_id"] ?? "",
    propertyClassId: json["property_class_id"] ?? "",
    buildingNumber: json["building_number"] ?? "",
    houseNumber: json["house_number"] ?? "",
    locality: json["locality"] ?? "",
    address2: json["address2"] ?? "",
    town: json["town"] ?? "",
    pinCode: json["pin_code"] ?? "",
    societyAllowedMdpe: json["society_allowed_mdpe"] ?? "",
    residentStatus: json["resident_status"] ?? "",
    noOfBathroom: json["no_of_bathroom"] ?? "",
    noOfKitchen: json["no_of_kitchen"] ?? "",
    existingCookingFuel: json["existing_cooking_fuel"] ?? "",
    noOfFamilyMembers: json["no_of_family_members"] ?? "",
    latitude: json["latitude"] ?? "",
    longitude: json["longitude"] ?? "",
    remarks: json["remarks"] ?? "",
    kycDocument1: json["kyc_document_1"] ?? "",
    kycDocument1Number: json["kyc_document_1_number"] ?? "",
    kycDocument2: json["kyc_document_2"] ?? "",
    kycDocument2Number: json["kyc_document_2_number"] ?? "",
    kycDocument3: json["kyc_document_3"] ?? "",
    kycDocument3Number: json["kyc_document_3_number"] ?? "",
    nameOfBank: json["name_of_bank"] ?? "",
    bankAccountNumber: json["bank_account_number"] ?? "",
    bankIfscCode: json["bank_ifsc_code"] ?? "",
    bankAddress: json["bank_address"] ?? "",
    initialDepositeStatus: json["initial_deposite_status"] ?? "",
    reasonForHold: json["reason_for_hold"] ?? "",
    depositeType: json["deposite_type"] ?? "",
    initialAmount: json["initial_amount"] ?? "",
    chequeNumber: json["cheque_number"] ?? "",
    payementBankName: json["payement_bank_name"] ?? "",
    micr: json["micr"] ?? "",
    documentUploads1: json["document_uploads_1"] ?? "",
    documentUploads2: json["document_uploads_2"] ?? "",
    documentUploads3: json["document_uploads_3"] ?? "",
    uploadCustomerPhoto: json["upload_customer_photo"] ?? "",
    uploadHousePhoto: json["upload_house_photo"] ?? "",
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "cheque_photo": chequePhoto,
    "cheque_bank_account": chequeBankAccount,
    "crn": crn,
    "first_name": firstName,
    "last_name": lastName,
    "dma_user_name": dmaUserName,
    "guardian_type": guardianType,
    "marketing_approval": marketingApproval,
    "mark_status_time": markStatusTime,
    "marketing_reject_reason": marketingRejectReason,
    "dma_user_id": dmaUserId,
    "date_of_registration": dateOfRegistration!.toIso8601String(),
    "customer_photo": customerPhoto,
    "house_photo": housePhoto,
    "owner_consent": ownerConsent,
    "customer_consent": customerConsent,
    "backside1": backside1,
    "backside2": backside2,
    "canceled_cheque": canceledCheque,
    "backside3": backside3,
    "accept_conversion_policy": acceptConversionPolicy,
    "accept_extra_fitting_cost": acceptExtraFittingCost,
    "kyc_document_1_image": kycDocument1Image,
    "kyc_document_2_image": kycDocument2Image,
    "kyc_document_3_image": kycDocument3Image,
    "district_id": districtId,
    "mode_of_deposite": modeOfDeposite,
    "dma_dir_path": dmaDirPath,
    "schema": schema,
    "interested": interested,
    "area_id": areaId,
    "mobile_number": mobileNumber,
    "middle_name": middleName,
    "guardian_name": guardianName,
    "email_id": emailId,
    "property_category_id": propertyCategoryId,
    "property_class_id": propertyClassId,
    "building_number": buildingNumber,
    "house_number": houseNumber,
    "locality": locality,
    "address2": address2,
    "town": town,
    "pin_code": pinCode,
    "society_allowed_mdpe": societyAllowedMdpe,
    "resident_status": residentStatus,
    "no_of_bathroom": noOfBathroom,
    "no_of_kitchen": noOfKitchen,
    "existing_cooking_fuel": existingCookingFuel,
    "no_of_family_members": noOfFamilyMembers,
    "latitude": latitude,
    "longitude": longitude,
    "remarks": remarks,
    "kyc_document_1": kycDocument1,
    "kyc_document_1_number": kycDocument1Number,
    "kyc_document_2": kycDocument2,
    "kyc_document_2_number": kycDocument2Number,
    "kyc_document_3": kycDocument3,
    "kyc_document_3_number": kycDocument3Number,
    "name_of_bank": nameOfBank,
    "bank_account_number": bankAccountNumber,
    "bank_ifsc_code": bankIfscCode,
    "bank_address": bankAddress,
    "initial_deposite_status": initialDepositeStatus,
    "reason_for_hold": reasonForHold,
    "deposite_type": depositeType,
    "initial_amount": initialAmount,
    "cheque_number": chequeNumber,
    "payement_bank_name": payementBankName,
    "micr": micr,
    "document_uploads_1": documentUploads1,
    "document_uploads_2": documentUploads2,
    "document_uploads_3": documentUploads3,
    "upload_customer_photo": uploadCustomerPhoto,
    "upload_house_photo": uploadHousePhoto,
    "id": id,
  };
}
