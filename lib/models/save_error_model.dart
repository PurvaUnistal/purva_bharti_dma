// // To parse this JSON data, do
// //
// //     final saveErrorModel = saveErrorModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SaveErrorModel saveErrorModelFromJson(String str) => SaveErrorModel.fromJson(json.decode(str));
//
// String saveErrorModelToJson(SaveErrorModel data) => json.encode(data.toJson());
//
// class SaveErrorModel {
//   final int success;
//   final List<SaveCusRegData> errors;
//
//   SaveErrorModel({
//      this.success,
//      this.errors,
//   });
//
//   factory SaveErrorModel.fromJson(Map<String, dynamic> json) => SaveErrorModel(
//     success: json["success"],
//     errors: List<SaveCusRegData>.from(json["errors"].map((x) => SaveCusRegData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
//   };
// }
//
// class SaveCusRegData {
//   final String crn;
//   final String firstName;
//   final String lastName;
//   final String dmaUserName;
//   final String guardianType;
//   final int marketingApproval;
//   final dynamic markStatusTime;
//   final dynamic marketingRejectReason;
//   final String dmaUserId;
//   final DateTime dateOfRegistration;
//   final String customerPhoto;
//   final String housePhoto;
//   final String ownerConsent;
//   final String customerConsent;
//   final String backside1;
//   final String backside2;
//   final String canceledCheque;
//   final String backside3;
//   final dynamic acceptConversionPolicy;
//   final dynamic acceptExtraFittingCost;
//   final DateTime initialDepositeDate;
//   final String kycDocument1Image;
//   final String kycDocument2Image;
//   final String kycDocument3Image;
//   final dynamic chequePhoto;
//   final String chequeBankAccount;
//   final String areaId;
//   final String mobileNumber;
//   final String alternateNumber;
//   final String middleName;
//   final String guardianName;
//   final String emailId;
//   final String propertyCategoryId;
//   final String propertyClassId;
//   final String houseNumber;
//   final String locality;
//   final String town;
//   final String pinCode;
//   final String societyAllowedMdpe;
//   final String residentStatus;
//   final String noOfKitchen;
//   final String noOfBathroom;
//   final String existingCookingFuel;
//   final String noOfFamilyMembers;
//   final String longitude;
//   final String latitude;
//   final String remarks;
//   final String schema;
//   final String kycDocument1;
//   final String kycDocument1Number;
//   final String kycDocument2;
//   final String kycDocument2Number;
//   final String kycDocument3;
//   final String nameOfBank;
//   final String bankAccountNumber;
//   final String bankIfscCode;
//   final String bankAddress;
//   final String initialDepositeStatus;
//   final String reasonForHold;
//   final String modeOfDeposite;
//   final String depositeType;
//   final String initialAmount;
//   final String payementBankName;
//   final String chequeNumber;
//   final String interested;
//   final String districtId;
//   final int id;
//
//   SaveCusRegData({
//     this.crn,
//     this.firstName,
//     this.lastName,
//     this.dmaUserName,
//     this.guardianType,
//     this.marketingApproval,
//     this.markStatusTime,
//     this.marketingRejectReason,
//     this.dmaUserId,
//     this.dateOfRegistration,
//     this.customerPhoto,
//     this.housePhoto,
//     this.ownerConsent,
//     this.customerConsent,
//     this.backside1,
//     this.backside2,
//     this.canceledCheque,
//     this.backside3,
//     this.acceptConversionPolicy,
//     this.acceptExtraFittingCost,
//     this.initialDepositeDate,
//     this.kycDocument1Image,
//     this.kycDocument2Image,
//     this.kycDocument3Image,
//     this.chequePhoto,
//     this.chequeBankAccount,
//     this.areaId,
//     this.mobileNumber,
//     this.alternateNumber,
//     this.middleName,
//     this.guardianName,
//     this.emailId,
//     this.propertyCategoryId,
//     this.propertyClassId,
//     this.houseNumber,
//     this.locality,
//     this.town,
//     this.pinCode,
//     this.societyAllowedMdpe,
//     this.residentStatus,
//     this.noOfKitchen,
//     this.noOfBathroom,
//     this.existingCookingFuel,
//     this.noOfFamilyMembers,
//     this.longitude,
//     this.latitude,
//     this.remarks,
//     this.schema,
//     this.kycDocument1,
//     this.kycDocument1Number,
//     this.kycDocument2,
//     this.kycDocument2Number,
//     this.kycDocument3,
//     this.nameOfBank,
//     this.bankAccountNumber,
//     this.bankIfscCode,
//     this.bankAddress,
//     this.initialDepositeStatus,
//     this.reasonForHold,
//     this.modeOfDeposite,
//     this.depositeType,
//     this.initialAmount,
//     this.payementBankName,
//     this.chequeNumber,
//     this.interested,
//     this.districtId,
//     this.id,
//   });
//
//   factory SaveCusRegData.fromRawJson(String str) =>
//       SaveCusRegData.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory SaveCusRegData.fromJson(Map<String, dynamic> json) => SaveCusRegData(
//     crn: json["crn"] ?? "",
//     firstName: json["first_name"] ?? "",
//     lastName: json["last_name"] ?? "",
//     dmaUserName: json["dma_user_name"] ?? "",
//     guardianType: json["guardian_type"] ?? "",
//     marketingApproval: json["marketing_approval"] ?? "",
//     markStatusTime: json["mark_status_time"] ?? "",
//     marketingRejectReason: json["marketing_reject_reason"],
//     dmaUserId: json["dma_user_id"] ?? "",
//     dateOfRegistration: DateTime.parse(json["date_of_registration"]) ?? "",
//     customerPhoto: json["customer_photo"] ?? "",
//     housePhoto: json["house_photo"] ?? "",
//     ownerConsent: json["owner_consent"] ?? "",
//     customerConsent: json["customer_consent"] ?? "",
//     backside1: json["backside1"] ?? "",
//     backside2: json["backside2"] ?? "",
//     canceledCheque: json["canceled_cheque"] ?? "",
//     backside3: json["backside3"] ?? "",
//     acceptConversionPolicy: json["accept_conversion_policy"] ?? "",
//     acceptExtraFittingCost: json["accept_extra_fitting_cost"] ?? "",
//     initialDepositeDate: json["initial_deposite_date"] == null ? DateTime.parse('0000-00-00') :DateTime.parse(json["initial_deposite_date"]),
//     kycDocument1Image: json["kyc_document_1_image"] ?? "",
//     kycDocument2Image: json["kyc_document_2_image"] ?? "",
//     kycDocument3Image: json["kyc_document_3_image"] ?? "",
//     chequePhoto: json["cheque_photo"] ?? "",
//     chequeBankAccount: json["cheque_bank_account"] ?? "",
//     areaId: json["area_id"] ?? "",
//     mobileNumber: json["mobile_number"] ?? "",
//     alternateNumber: json["alternateMobile"] ?? "",
//     middleName: json["middle_name"] ?? "",
//     guardianName: json["guardian_name"] ?? "",
//     emailId: json["email_id"] ?? "",
//     propertyCategoryId: json["property_category_id"] ?? "",
//     propertyClassId: json["property_class_id"] ?? "",
//     houseNumber: json["house_number"] ?? "",
//     locality: json["locality"] ?? "",
//     town: json["town"] ?? "",
//     pinCode: json["pin_code"] ?? "",
//     societyAllowedMdpe: json["society_allowed_mdpe"] ?? "",
//     residentStatus: json["resident_status"] ?? "",
//     noOfKitchen: json["no_of_kitchen"] ?? "",
//     noOfBathroom: json["no_of_bathroom"] ?? "",
//     existingCookingFuel: json["existing_cooking_fuel"] ?? "",
//     noOfFamilyMembers: json["no_of_family_members"] ?? "",
//     longitude: json["longitude"] ?? "",
//     latitude: json["latitude"] ?? "",
//     remarks: json["remarks"] ?? "",
//     schema: json["schema"] ?? "",
//     kycDocument1: json["kyc_document_1"] ?? "",
//     kycDocument1Number: json["kyc_document_1_number"] ?? "",
//     kycDocument2: json["kyc_document_2"] ?? "",
//     kycDocument2Number: json["kyc_document_2_number"] ?? "",
//     kycDocument3: json["kyc_document_3"] ?? "",
//     nameOfBank: json["name_of_bank"] ?? "",
//     bankAccountNumber: json["bank_account_number"] ?? "",
//     bankIfscCode: json["bank_ifsc_code"] ?? "",
//     bankAddress: json["bank_address"] ?? "",
//     initialDepositeStatus: json["initial_deposite_status"] ?? "",
//     reasonForHold: json["reason_for_hold"] ?? "",
//     modeOfDeposite: json["mode_of_deposite"] ?? "",
//     depositeType: json["deposite_type"] ?? "",
//     initialAmount: json["initial_amount"] ?? "",
//     payementBankName: json["payement_bank_name"] ?? "",
//     chequeNumber: json["cheque_number"] ?? "",
//     interested: json["interested"] ?? "",
//     districtId: json["district_id"] ?? "",
//     id: json["id"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "crn": crn,
//     "first_name": firstName,
//     "last_name": lastName,
//     "dma_user_name": dmaUserName,
//     "guardian_type": guardianType,
//     "marketing_approval": marketingApproval,
//     "mark_status_time": markStatusTime,
//     "marketing_reject_reason": marketingRejectReason,
//     "dma_user_id": dmaUserId,
//     "date_of_registration": dateOfRegistration.toIso8601String(),
//     "customer_photo": customerPhoto,
//     "house_photo": housePhoto,
//     "owner_consent": ownerConsent,
//     "customer_consent": customerConsent,
//     "backside1": backside1,
//     "backside2": backside2,
//     "canceled_cheque": canceledCheque,
//     "backside3": backside3,
//     "accept_conversion_policy": acceptConversionPolicy,
//     "accept_extra_fitting_cost": acceptExtraFittingCost,
//     "initial_deposite_date":
//     "${initialDepositeDate.year.toString().padLeft(4, '0')}-${initialDepositeDate.month.toString().padLeft(2, '0')}-${initialDepositeDate.day.toString().padLeft(2, '0')}",
//     "kyc_document_1_image": kycDocument1Image,
//     "kyc_document_2_image": kycDocument2Image,
//     "kyc_document_3_image": kycDocument3Image,
//     "cheque_photo": chequePhoto,
//     "cheque_bank_account": chequeBankAccount,
//     "area_id": areaId,
//     "mobile_number": mobileNumber,
//     "alternateMobile": alternateNumber,
//     "middle_name": middleName,
//     "guardian_name": guardianName,
//     "email_id": emailId,
//     "property_category_id": propertyCategoryId,
//     "property_class_id": propertyClassId,
//     "house_number": houseNumber,
//     "locality": locality,
//     "town": town,
//     "pin_code": pinCode,
//     "society_allowed_mdpe": societyAllowedMdpe,
//     "resident_status": residentStatus,
//     "no_of_kitchen": noOfKitchen,
//     "no_of_bathroom": noOfBathroom,
//     "existing_cooking_fuel": existingCookingFuel,
//     "no_of_family_members": noOfFamilyMembers,
//     "longitude": longitude,
//     "latitude": latitude,
//     "remarks": remarks,
//     "schema": schema,
//     "kyc_document_1": kycDocument1,
//     "kyc_document_1_number": kycDocument1Number,
//     "kyc_document_2": kycDocument2,
//     "kyc_document_2_number": kycDocument2Number,
//     "kyc_document_3": kycDocument3,
//     "name_of_bank": nameOfBank,
//     "bank_account_number": bankAccountNumber,
//     "bank_ifsc_code": bankIfscCode,
//     "bank_address": bankAddress,
//     "initial_deposite_status": initialDepositeStatus,
//     "reason_for_hold": reasonForHold,
//     "mode_of_deposite": modeOfDeposite,
//     "deposite_type": depositeType,
//     "initial_amount": initialAmount,
//     "payement_bank_name": payementBankName,
//     "cheque_number": chequeNumber,
//     "interested": interested,
//     "district_id": districtId,
//     "id": id,
//   };
// }
//
