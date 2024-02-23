// To parse this JSON data, do
//
//     final saveCustomerRegistrationModel = saveCustomerRegistrationModelFromJson(jsonString);

import 'dart:convert';

SaveCustomerRegistrationModel saveCustomerRegistrationModelFromJson(String str) => SaveCustomerRegistrationModel.fromJson(json.decode(str));

String saveCustomerRegistrationModelToJson(SaveCustomerRegistrationModel data) => json.encode(data.toJson());

class SaveCustomerRegistrationModel {
  int? success;
  List<Message>? message;

  SaveCustomerRegistrationModel({
    this.success,
    this.message,
  });

  factory SaveCustomerRegistrationModel.fromJson(Map<String, dynamic> json) => SaveCustomerRegistrationModel(
        success: json["success"],
        message: List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class Message {
  SaveCusRegData? data;
  String? message;

  Message({
    this.data,
    this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        data: SaveCusRegData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
      };
}

class SaveCusRegData {
  String? chequePhoto;
  String? chequeBankAccount;
  String? chequeDepositDate;
  String? crn;
  String? firstName;
  String? lastName;
  String? dmaUserName;
  String? guardianType;
  int? marketingApproval;
  dynamic markStatusTime;
  dynamic marketingRejectReason;
  String? dmaUserId;
  DateTime? dateOfRegistration;
  String? customerPhoto;
  String? housePhoto;
  String? ownerConsent;
  String? customerConsent;
  String? backside1;
  String? backside2;
  String? canceledCheque;
  String? backside3;
  String? acceptConversionPolicy;
  String? acceptExtraFittingCost;
  String? kycDocument1Image;
  String? kycDocument2Image;
  String? kycDocument3Image;
  String? districtId;
  String? areaId;
  String? chargeId;
  String? mobileNumber;
  String? alternateMobile;
  String? middleName;
  String? guardianName;
  String? emailId;
  String? propertyCategoryId;
  String? propertyClassId;
  String? houseNumber;
  String? streetName;
  String? town;
  String? pinCode;
  String? societyAllowedMdpe;
  String? residentStatus;
  String? noOfKitchen;
  String? noOfBathroom;
  String? existingCookingFuel;
  String? noOfFamilyMembers;
  String? longitude;
  String? latitude;
  String? noInitialDepositStatusReason;
  String? schema;
  String? kycDocument1;
  String? kycDocument1Number;
  String? kycDocument2;
  String? kycDocument2Number;
  String? kycDocument3;
  String? bankNameOfBank;
  String? bankAccountNumber;
  String? bankIfscCode;
  String? bankAddress;
  String? initialDepositeStatus;
  String? nearestLandmark;
  String? modeOfDeposite;
  String? depositType;
  String? depositTypeAmount;
  String? payementBankName;
  String? chequeNumber;
  String? interested;
  String? kycDocument3Number;
  String? chequeMicrNo;
  String? buildingNumber;
  String? colonySocietyApartment;
  String? documentUploads1;
  String? documentUploads2;
  String? documentUploads3;
  String? uploadCustomerPhoto;
  String? uploadHousePhoto;
  String? eBillingModel;
  int? id;

  SaveCusRegData({
    this.chequePhoto,
    this.chequeBankAccount,
    this.chequeDepositDate,
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
    this.areaId,
    this.chargeId,
    this.mobileNumber,
    this.alternateMobile,
    this.middleName,
    this.guardianName,
    this.emailId,
    this.propertyCategoryId,
    this.propertyClassId,
    this.houseNumber,
    this.streetName,
    this.town,
    this.pinCode,
    this.societyAllowedMdpe,
    this.residentStatus,
    this.noOfKitchen,
    this.noOfBathroom,
    this.existingCookingFuel,
    this.noOfFamilyMembers,
    this.longitude,
    this.latitude,
    this.noInitialDepositStatusReason,
    this.schema,
    this.kycDocument1,
    this.kycDocument1Number,
    this.kycDocument2,
    this.kycDocument2Number,
    this.kycDocument3,
    this.bankNameOfBank,
    this.bankAccountNumber,
    this.bankIfscCode,
    this.bankAddress,
    this.initialDepositeStatus,
    this.nearestLandmark,
    this.modeOfDeposite,
    this.depositType,
    this.depositTypeAmount,
    this.payementBankName,
    this.chequeNumber,
    this.interested,
    this.kycDocument3Number,
    this.chequeMicrNo,
    this.buildingNumber,
    this.colonySocietyApartment,
    this.documentUploads1,
    this.documentUploads2,
    this.documentUploads3,
    this.uploadCustomerPhoto,
    this.uploadHousePhoto,
    this.eBillingModel,
    this.id,
  });

  factory SaveCusRegData.fromJson(Map<String, dynamic> json) => SaveCusRegData(
        chequePhoto: json["cheque_photo"] == null ? "" : json["cheque_photo"],
        chequeBankAccount: json["cheque_bank_account"] == null ? "" : json["cheque_bank_account"],
        chequeDepositDate: json["initial_deposite_date"] == null ? "" : json["initial_deposite_date"],
        crn: json["crn"] == null ? "" : json["crn"],
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        dmaUserName: json["dma_user_name"] == null ? "" : json["dma_user_name"],
        guardianType: json["guardian_type"] == null ? "" : json["guardian_type"],
        marketingApproval: json["marketing_approval"] == null ? "" : json["marketing_approval"],
        markStatusTime: json["mark_status_time"] == null ? "" : json["mark_status_time"],
        marketingRejectReason: json["marketing_reject_reason"] == null ? "" : json["marketing_reject_reason"],
        dmaUserId: json["dma_user_id"] == null ? "" : json["dma_user_id"],
        dateOfRegistration: DateTime.parse(json["date_of_registration"] == null ? "" : json["date_of_registration"]),
        customerPhoto: json["customer_photo"] == null ? "" : json["customer_photo"],
        housePhoto: json["house_photo"] == null ? "" : json["house_photo"],
        ownerConsent: json["owner_consent"] == null ? "" : json["owner_consent"],
        customerConsent: json["customer_consent"] == null ? "" : json["customer_consent"],
        backside1: json["backside1"] == null ? "" : json["backside1"],
        backside2: json["backside2"] == null ? "" : json["backside2"],
        canceledCheque: json["canceled_cheque"] == null ? "" : json["canceled_cheque"],
        backside3: json["backside3"] == null ? "" : json["backside3"],
        acceptConversionPolicy: json["accept_conversion_policy"] == null ? "" : json["accept_conversion_policy"],
        acceptExtraFittingCost: json["accept_extra_fitting_cost"] == null ? "" : json["accept_extra_fitting_cost"],
        kycDocument1Image: json["kyc_document_1_image"] == null ? "" : json["kyc_document_1_image"],
        kycDocument2Image: json["kyc_document_2_image"] == null ? "" : json["kyc_document_2_image"],
        kycDocument3Image: json["kyc_document_3_image"] == null ? "" : json["kyc_document_3_image"],
        districtId: json["district_id"] == null ? "" : json["district_id"],
        areaId: json["area_id"] == null ? "" : json["area_id"],
        chargeId: json["gid"] == null ? "" : json["gid"],
        mobileNumber: json["mobile_number"] == null ? "" : json["mobile_number"],
    alternateMobile: json["alternateMobile"] == null ? "" : json["alternateMobile"],
        middleName: json["middle_name"] == null ? "" : json["middle_name"],
        guardianName: json["guardian_name"] == null ? "" : json["guardian_name"],
        emailId: json["email_id"] == null ? "" : json["email_id"],
        propertyCategoryId: json["property_category_id"] == null ? "" : json["property_category_id"],
        propertyClassId: json["property_class_id"] == null ? "" : json["property_class_id"],
        houseNumber: json["house_number"] == null ? "" : json["house_number"],
        streetName: json["locality"] == null ? "" : json["locality"],
        town: json["town"] == null ? "" : json["town"],
        pinCode: json["pin_code"] == null ? "" : json["pin_code"],
        societyAllowedMdpe: json["society_allowed_mdpe"] == null ? "" : json["society_allowed_mdpe"],
        residentStatus: json["resident_status"] == null ? "" : json["resident_status"],
        noOfKitchen: json["no_of_kitchen"] == null ? "" : json["no_of_kitchen"],
        noOfBathroom: json["no_of_bathroom"] == null ? "" : json["no_of_bathroom"],
        existingCookingFuel: json["existing_cooking_fuel"] == null ? "" : json["existing_cooking_fuel"],
        noOfFamilyMembers: json["no_of_family_members"] == null ? "" : json["no_of_family_members"],
        longitude: json["longitude"] == null ? "" : json["longitude"],
        latitude: json["latitude"] == null ? "" : json["latitude"],
        noInitialDepositStatusReason: json["remarks"] == null ? "" : json["remarks"],
        schema: json["schema"] == null ? "" : json["schema"],
        kycDocument1: json["kyc_document_1"] == null ? "" : json["kyc_document_1"],
        kycDocument1Number: json["kyc_document_1_number"] == null ? "" : json["kyc_document_1_number"],
        kycDocument2: json["kyc_document_2"] == null ? "" : json["kyc_document_2"],
        kycDocument2Number: json["kyc_document_2_number"] == null ? "" : json["kyc_document_2_number"],
        kycDocument3: json["kyc_document_3"] == null ? "" : json["kyc_document_3"],
        bankNameOfBank: json["name_of_bank"] == null ? "" : json["name_of_bank"],
        bankAccountNumber: json["bank_account_number"] == null ? "" : json["bank_account_number"],
        bankIfscCode: json["bank_ifsc_code"] == null ? "" : json["bank_ifsc_code"],
        bankAddress: json["bank_address"] == null ? "" : json["bank_address"],
        initialDepositeStatus: json["initial_deposite_status"] == null ? "" : json["initial_deposite_status"],
        nearestLandmark: json["reason_for_hold"] == null ? "" : json["reason_for_hold"],
        modeOfDeposite: json["mode_of_deposite"] == null ? "" : json["mode_of_deposite"],
        depositType: json["deposite_type"] == null ? "" : json["deposite_type"],
        depositTypeAmount: json["initial_amount"] == null ? "" : json["initial_amount"],
        payementBankName: json["payement_bank_name"] == null ? "" : json["payement_bank_name"],
        chequeNumber: json["cheque_number"] == null ? "" : json["cheque_number"],
        interested: json["interested"] == null ? "" : json["interested"],
        kycDocument3Number: json["kyc_document_3_number"] == null ? "" : json["kyc_document_3_number"],
        chequeMicrNo: json["micr"] == null ? "" : json["micr"],
        buildingNumber: json["building_number"] == null ? "" : json["building_number"],
        colonySocietyApartment: json["address2"] == null ? "" : json["address2"],
        documentUploads1: json["document_uploads_1"] == null ? "" : json["document_uploads_1"],
        documentUploads2: json["document_uploads_2"] == null ? "" : json["document_uploads_2"],
        documentUploads3: json["document_uploads_3"] == null ? "" : json["document_uploads_3"],
        uploadCustomerPhoto: json["upload_customer_photo"] == null ? "" : json["upload_customer_photo"],
        uploadHousePhoto: json["upload_house_photo"] == null ? "" : json["upload_house_photo"],
        eBillingModel: json["ebilling"] == null ? "" : json["ebilling"],
        id: json["id"] == null ? "" : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "cheque_photo": chequePhoto,
        "cheque_bank_account": chequeBankAccount,
        "initial_deposite_date": chequeDepositDate,
        "first_name": firstName,
        "last_name": lastName,
        "dma_user_name": dmaUserName,
        "guardian_type": guardianType,
        "marketing_approval": marketingApproval,
        "mark_status_time": markStatusTime,
        "marketing_reject_reason": marketingRejectReason,
        "dma_user_id": dmaUserId,
        "date_of_registration": dateOfRegistration?.toIso8601String(),
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
        "area_id": areaId,
        "gid": chargeId,
        "mobile_number": mobileNumber,
        "alternateMobile": alternateMobile,
        "middle_name": middleName,
        "guardian_name": guardianName,
        "email_id": emailId,
        "property_category_id": propertyCategoryId,
        "property_class_id": propertyClassId,
        "house_number": houseNumber,
        "locality": streetName,
        "town": town,
        "pin_code": pinCode,
        "society_allowed_mdpe": societyAllowedMdpe,
        "resident_status": residentStatus,
        "no_of_kitchen": noOfKitchen,
        "no_of_bathroom": noOfBathroom,
        "existing_cooking_fuel": existingCookingFuel,
        "no_of_family_members": noOfFamilyMembers,
        "longitude": longitude,
        "latitude": latitude,
        "remarks": noInitialDepositStatusReason,
        "schema": schema,
        "kyc_document_1": kycDocument1,
        "kyc_document_1_number": kycDocument1Number,
        "kyc_document_2": kycDocument2,
        "kyc_document_2_number": kycDocument2Number,
        "kyc_document_3": kycDocument3,
        "name_of_bank": bankNameOfBank,
        "bank_account_number": bankAccountNumber,
        "bank_ifsc_code": bankIfscCode,
        "bank_address": bankAddress,
        "initial_deposite_status": initialDepositeStatus,
        "reason_for_hold": nearestLandmark,
        "mode_of_deposite": modeOfDeposite,
        "deposite_type": depositType,
        "initial_amount": depositTypeAmount,
        "payement_bank_name": payementBankName,
        "cheque_number": chequeNumber,
        "interested": interested,
        "kyc_document_3_number": kycDocument3Number,
        "micr": chequeMicrNo,
        "building_number": buildingNumber,
        "address2": colonySocietyApartment,
        "document_uploads_1": documentUploads1,
        "document_uploads_2": documentUploads2,
        "document_uploads_3": documentUploads3,
        "upload_customer_photo": uploadCustomerPhoto,
        "upload_house_photo": uploadHousePhoto,
        "ebilling": eBillingModel,
        "id": id,
      };
}
