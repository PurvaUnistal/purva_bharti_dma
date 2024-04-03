// To parse this JSON data, do
//
//     final saveCustomerRegistrationOfflineModel = saveCustomerRegistrationOfflineModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'CustRegSyncModel.g.dart';

SaveCustomerRegistrationOfflineModel saveCustomerRegistrationOfflineModelFromJson(String str) => SaveCustomerRegistrationOfflineModel.fromJson(json.decode(str));

String saveCustomerRegistrationOfflineModelToJson(SaveCustomerRegistrationOfflineModel data) => json.encode(data.toJson());

class SaveCustomerRegistrationOfflineModel {
  final int success;
  final List<Message> message;

  SaveCustomerRegistrationOfflineModel({
    required this.success,
    required this.message,
  });

  factory SaveCustomerRegistrationOfflineModel.fromJson(Map<String, dynamic> json) => SaveCustomerRegistrationOfflineModel(
    success: json["success"],
    message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": List<dynamic>.from(message.map((x) => x.toJson())),
  };
}

class Message {
  final CustRegSync data;
  final String message;

  Message({
    required this.data,
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    data: CustRegSync.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };
}


@HiveType(typeId: HiveTypeId.CustRegSyncId)

class CustRegSync {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final int? marketingApproval;
  @HiveField(2)
  final dynamic markStatusTime;
  @HiveField(3)
  final dynamic marketingRejectReason;
  @HiveField(4)
  final DateTime? dateOfRegistration;
  @HiveField(5)
  final String? dmaDirPath;
  @HiveField(6)
  final String? schema;
  @HiveField(7)
  final String? firstName;
  @HiveField(8)
  final String? middleName;
  @HiveField(9)
  final String? lastName;
  @HiveField(10)
  final String? dmaUserName;
  @HiveField(11)
  final String? dmaUserId;
  @HiveField(12)
  final String? guardianType;
  @HiveField(13)
  final String? guardianName;
  @HiveField(14)
  final String? interested;
  @HiveField(15)
  final String? areaId;
  @HiveField(16)
  final String? chargeId;
  @HiveField(17)
  final String? mobileNumber;
  @HiveField(18)
  final String? alternateMobile;
  @HiveField(19)
  final String? emailId;
  @HiveField(20)
  final String? propertyCategoryId;
  @HiveField(21)
  final String? propertyClassId;
  @HiveField(22)
  final String? acceptConversionPolicy;
  @HiveField(23)
  final String? acceptExtraFittingCost;
  @HiveField(24)
  final String? buildingNumber;
  @HiveField(25)
  final String? houseNumber;
  @HiveField(26)
  final String? streetName;
  @HiveField(27)
  final String? colonySocietyApartment;
  @HiveField(28)
  final String? town;
  @HiveField(29)
  final String? pinCode;
  @HiveField(30)
  final String? districtId;
  @HiveField(31)
  final String? societyAllowedMdpe;
  @HiveField(32)
  final String? residentStatus;
  @HiveField(33)
  final String? noOfBathroom;
  @HiveField(34)
  final String? noOfKitchen;
  @HiveField(35)
  final String? existingCookingFuel;
  @HiveField(36)
  final String? noOfFamilyMembers;
  @HiveField(37)
  final String? latitude;
  @HiveField(38)
  final String? longitude;
  @HiveField(39)
  final String? noInitialDepositStatusReason;
  @HiveField(40)
  final String? kycDocument1;
  @HiveField(41)
  final String? kycDocument1Number;
  @HiveField(42)
  final String? kycDocument2;
  @HiveField(43)
  final String? kycDocument2Number;
  @HiveField(44)
  final String? kycDocument3;
  @HiveField(45)
  final String? kycDocument3Number;
  @HiveField(46)
  final String? nameOfBank;
  @HiveField(47)
  final String? bankAccountNumber;
  @HiveField(48)
  final String? bankIfscCode;
  @HiveField(49)
  final String? bankAddress;
  @HiveField(50)
  final String? modeOfDeposit;
  @HiveField(51)
  final String? initialDepositStatus;
  @HiveField(52)
  final String? nearestLandmark;
  @HiveField(53)
  final String? depositType;
  @HiveField(54)
  final String? initialAmount;
  @HiveField(55)
  final String? chequeNumber;
  @HiveField(56)
  final String? paymentBankName;
  @HiveField(57)
  final String? chequeBankAccount;
  @HiveField(58)
  final dynamic crn;
  @HiveField(59)
  final String? micr;
  @HiveField(60)
  final String? backside1;
  @HiveField(61)
  final String? backside2;
  @HiveField(62)
  final String? backside3;
  @HiveField(63)
  final String? documentUploads1;
  @HiveField(64)
  final String? documentUploads2;
  @HiveField(65)
  final String? documentUploads3;
  @HiveField(66)
  final String? kycDocument1Image;
  @HiveField(67)
  final String? kycDocument2Image;
  @HiveField(68)
  final String? kycDocument3Image;
  @HiveField(69)
  final String? canceledCheque;
  @HiveField(70)
  final String? uploadCustomerPhoto;
  @HiveField(71)
  final String? uploadHousePhoto;
  @HiveField(72)
  final String? chequePhoto;
  @HiveField(73)
  final String? customerPhoto;
  @HiveField(74)
  final String? housePhoto;
  @HiveField(75)
  final String? ownerConsent;
  @HiveField(76)
  final String? customerConsent;
  @HiveField(78)
  bool? isDepositChq;
  @HiveField(79)
  String? eBillingModel;
  @HiveField(80)
  String? chequeDepositDate;

  CustRegSync({
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
     this.modeOfDeposit,
     this.dmaDirPath,
     this.schema,
     this.interested,
     this.areaId,
     this.chargeId,
     this.mobileNumber,
     this.alternateMobile,
     this.middleName,
     this.guardianName,
     this.emailId,
     this.propertyCategoryId,
     this.propertyClassId,
     this.buildingNumber,
     this.houseNumber,
     this.streetName,
     this.colonySocietyApartment,
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
     this.noInitialDepositStatusReason,
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
     this.initialDepositStatus,
     this.nearestLandmark,
     this.depositType,
     this.initialAmount,
     this.chequeNumber,
     this.paymentBankName,
     this.micr,
     this.documentUploads1,
     this.documentUploads2,
     this.documentUploads3,
     this.uploadCustomerPhoto,
     this.uploadHousePhoto,
     this.id,
    this.isDepositChq = false,
    this.eBillingModel,
    this.chequeDepositDate,
  });

  factory CustRegSync.fromJson(Map<String, dynamic> json) => CustRegSync(
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
    dateOfRegistration: json["date_of_registration"] == null ? null : DateTime.parse(json["date_of_registration"]),
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
    modeOfDeposit: json["mode_of_deposite"] ?? "",
    dmaDirPath: json["dma_dir_path"] ?? "",
    schema: json["schema"] ?? "",
    interested: json["interested"] ?? "",
    areaId: json["area_id"] ?? "",
    chargeId: json["gid"] == null ? "" : json["gid"] ?? "",
    mobileNumber: json["mobile_number"] ?? "",
    alternateMobile: json["alternateMobile"] == null ? "" : json["alternateMobile"] ?? "",
    middleName: json["middle_name"] ?? "",
    guardianName: json["guardian_name"] ?? "",
    emailId: json["email_id"] ?? "",
    propertyCategoryId: json["property_category_id"] ?? "",
    propertyClassId: json["property_class_id"] ?? "",
    buildingNumber: json["building_number"] ?? "",
    houseNumber: json["house_number"] ?? "",
    streetName: json["locality"] ?? "",
    colonySocietyApartment: json["address2"] ?? "",
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
    noInitialDepositStatusReason: json["remarks"] ?? "",
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
    initialDepositStatus: json["initial_deposite_status"] ?? "",
    nearestLandmark: json["reason_for_hold"] ?? "",
    depositType: json["deposite_type"] ?? "",
    initialAmount: json["initial_amount"] ?? "",
    chequeNumber: json["cheque_number"] ?? "",
    paymentBankName: json["payement_bank_name"] ?? "",
    micr: json["micr"] ?? "",
    documentUploads1: json["document_uploads_1"] ?? "",
    documentUploads2: json["document_uploads_2"] ?? "",
    documentUploads3: json["document_uploads_3"] ?? "",
    uploadCustomerPhoto: json["upload_customer_photo"] ?? "",
    uploadHousePhoto: json["upload_house_photo"] ?? "",
    id: json["id"] ?? "",
    eBillingModel: json["ebilling"] == null ? "" : json["ebilling"] ?? "",
    chequeDepositDate: json["initial_deposite_date"] == null ? "" : json["initial_deposite_date"] ?? "",

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
    "date_of_registration": dateOfRegistration?.toIso8601String() ?? "",
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
    "mode_of_deposite": modeOfDeposit,
    "dma_dir_path": dmaDirPath,
    "schema": schema,
    "interested": interested,
    "area_id": areaId,
    "gid": chargeId,
    "mobile_number": mobileNumber,
    "alternateMobile": alternateMobile,
    "middle_name": middleName,
    "guardian_name": guardianName,
    "email_id": emailId,
    "property_category_id": propertyCategoryId,
    "property_class_id": propertyClassId,
    "building_number": buildingNumber,
    "house_number": houseNumber,
    "locality": streetName,
    "address2": colonySocietyApartment,
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
    "remarks": noInitialDepositStatusReason,
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
    "initial_deposite_status": initialDepositStatus,
    "reason_for_hold": nearestLandmark,
    "deposite_type": depositType,
    "initial_amount": initialAmount,
    "cheque_number": chequeNumber,
    "payement_bank_name": paymentBankName,
    "micr": micr,
    "document_uploads_1": documentUploads1,
    "document_uploads_2": documentUploads2,
    "document_uploads_3": documentUploads3,
    "upload_customer_photo": uploadCustomerPhoto,
    "upload_house_photo": uploadHousePhoto,
    "id": id,
    "ebilling": eBillingModel,
    "initial_deposite_date": chequeDepositDate,
  };
}
