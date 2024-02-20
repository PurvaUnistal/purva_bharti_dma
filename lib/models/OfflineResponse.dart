class OfflineResponse {
  int? success;
  List<Message>? message;

  OfflineResponse({this.success, this.message});

  OfflineResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['message'] != String) {
      message = [];
      json['message'].forEach((v) {
        message!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.message != String) {
      data['message'] = this.message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  Data? data;
  String? message;

  Message({this.data, this.message});

  Message.fromJson(Map<String, dynamic> json) {
    data = new Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != String) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? crn;
  String? dmaUserName;
  String? guardianType;
  String? marketingApproval;
  String? markStatusTime;
  String? marketingRejectReason;
  String? dmaUserId;
  String? dateOfRegistration;
  String? customerPhoto;
  String? housePhoto;
  String? ownerConsent;
  String? backside1;
  String? backside2;
  String? backside3;
  String? kycDocument1Image;
  String? kycDocument2Image;
  String? kycDocument3Image;
  String? chequePhoto;
  String? areaId;
  String? mobileNumber;
  String? firstName;
  String? lastName;
  String? middleName;
  String? guardianName;
  String? emailId;
  String? propertyCategoryId;
  String? propertyClassId;
  String? houseNumber;
  String? locality;
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
  String? remarks;
  String? schema;
  String? kycDocument1;
  String? kycDocument1Number;
  String? kycDocument2;
  String? kycDocument2Number;
  String? kycDocument3;
  String? nameOfBank;
  String? bankAccountNumber;
  String? bankIfscCode;
  String? bankAddress;
  String? initialDepositeStatus;
  String? reasonForHold;
  String? modeOfDeposite;
  String? depositeType;
  String? initialAmount;
  String? initialDepositeDate;
  String? payementBankName;
  String? chequeBankAccount;
  String? chequeNumber;
  String? interested;
  String? accept_conversion_policy;
  String? accept_extra_fitting_cost;

  Data(
      {this.crn,
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
      this.backside1,
      this.backside2,
      this.backside3,
      this.kycDocument1Image,
      this.kycDocument2Image,
      this.kycDocument3Image,
      this.chequePhoto,
      this.areaId,
      this.mobileNumber,
      this.firstName,
      this.lastName,
      this.middleName,
      this.guardianName,
      this.emailId,
      this.propertyCategoryId,
      this.propertyClassId,
      this.houseNumber,
      this.locality,
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
      this.remarks,
      this.schema,
      this.kycDocument1,
      this.kycDocument1Number,
      this.kycDocument2,
      this.kycDocument2Number,
      this.kycDocument3,
      this.nameOfBank,
      this.bankAccountNumber,
      this.bankIfscCode,
      this.bankAddress,
      this.initialDepositeStatus,
      this.reasonForHold,
      this.modeOfDeposite,
      this.depositeType,
      this.initialAmount,
      this.initialDepositeDate,
      this.payementBankName,
      this.chequeBankAccount,
      this.chequeNumber,
      this.accept_conversion_policy,
      this.accept_extra_fitting_cost,
      this.interested});

  Data.fromJson(Map<String, dynamic> json) {
    crn = json['crn'];
    accept_conversion_policy = json['accept_conversion_policy'];
    accept_extra_fitting_cost = json['accept_extra_fitting_cost'];
    dmaUserName = json['dma_user_name'];
    guardianType = json['guardian_type'];
    marketingApproval = json['marketing_approval'];
    markStatusTime = json['mark_status_time'];
    marketingRejectReason = json['marketing_reject_reason'];
    dmaUserId = json['dma_user_id'];
    dateOfRegistration = json['date_of_registration'];
    customerPhoto = json['customer_photo'];
    housePhoto = json['house_photo'];
    ownerConsent = json['owner_consent'];
    backside1 = json['backside1'];
    backside2 = json['backside2'];
    backside3 = json['backside3'];
    kycDocument1Image = json['kyc_document_1_image'];
    kycDocument2Image = json['kyc_document_2_image'];
    kycDocument3Image = json['kyc_document_3_image'];
    chequePhoto = json['cheque_photo'];
    areaId = json['area_id'];
    mobileNumber = json['mobile_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    guardianName = json['guardian_name'];
    emailId = json['email_id'];
    propertyCategoryId = json['property_category_id'];
    propertyClassId = json['property_class_id'];
    houseNumber = json['house_number'];
    locality = json['locality'];
    town = json['town'];
    pinCode = json['pin_code'];
    societyAllowedMdpe = json['society_allowed_mdpe'];
    residentStatus = json['resident_status'];
    noOfKitchen = json['no_of_kitchen'];
    noOfBathroom = json['no_of_bathroom'];
    existingCookingFuel = json['existing_cooking_fuel'];
    noOfFamilyMembers = json['no_of_family_members'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    remarks = json['remarks'];
    schema = json['schema'];
    kycDocument1 = json['kyc_document_1'];
    kycDocument1Number = json['kyc_document_1_number'];
    kycDocument2 = json['kyc_document_2'];
    kycDocument2Number = json['kyc_document_2_number'];
    kycDocument3 = json['kyc_document_3'];
    nameOfBank = json['name_of_bank'];
    bankAccountNumber = json['bank_account_number'];
    bankIfscCode = json['bank_ifsc_code'];
    bankAddress = json['bank_address'];
    initialDepositeStatus = json['initial_deposite_status'];
    reasonForHold = json['reason_for_hold'];
    modeOfDeposite = json['mode_of_deposite'];
    depositeType = json['deposite_type'];
    initialAmount = json['initial_amount'];
    initialDepositeDate = json['initial_deposite_date'];
    payementBankName = json['payement_bank_name'];
    chequeBankAccount = json['cheque_bank_account'];
    chequeNumber = json['cheque_number'];
    interested = json['interested'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crn'] = this.crn;
    data['accept_conversion_policy'] = this.accept_conversion_policy;
    data['accept_extra_fitting_cost'] = this.accept_extra_fitting_cost;
    data['dma_user_name'] = this.dmaUserName;
    data['guardian_type'] = this.guardianType;
    data['marketing_approval'] = this.marketingApproval;
    data['mark_status_time'] = this.markStatusTime;
    data['marketing_reject_reason'] = this.marketingRejectReason;
    data['dma_user_id'] = this.dmaUserId;
    data['date_of_registration'] = this.dateOfRegistration;
    data['customer_photo'] = this.customerPhoto;
    data['house_photo'] = this.housePhoto;
    data['owner_consent'] = this.ownerConsent;
    data['backside1'] = this.backside1;
    data['backside2'] = this.backside2;
    data['backside3'] = this.backside3;
    data['kyc_document_1_image'] = this.kycDocument1Image;
    data['kyc_document_2_image'] = this.kycDocument2Image;
    data['kyc_document_3_image'] = this.kycDocument3Image;
    data['cheque_photo'] = this.chequePhoto;
    data['area_id'] = this.areaId;
    data['mobile_number'] = this.mobileNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['guardian_name'] = this.guardianName;
    data['email_id'] = this.emailId;
    data['property_category_id'] = this.propertyCategoryId;
    data['property_class_id'] = this.propertyClassId;
    data['house_number'] = this.houseNumber;
    data['locality'] = this.locality;
    data['town'] = this.town;
    data['pin_code'] = this.pinCode;
    data['society_allowed_mdpe'] = this.societyAllowedMdpe;
    data['resident_status'] = this.residentStatus;
    data['no_of_kitchen'] = this.noOfKitchen;
    data['no_of_bathroom'] = this.noOfBathroom;
    data['existing_cooking_fuel'] = this.existingCookingFuel;
    data['no_of_family_members'] = this.noOfFamilyMembers;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['remarks'] = this.remarks;
    data['schema'] = this.schema;
    data['kyc_document_1'] = this.kycDocument1;
    data['kyc_document_1_number'] = this.kycDocument1Number;
    data['kyc_document_2'] = this.kycDocument2;
    data['kyc_document_2_number'] = this.kycDocument2Number;
    data['kyc_document_3'] = this.kycDocument3;
    data['name_of_bank'] = this.nameOfBank;
    data['bank_account_number'] = this.bankAccountNumber;
    data['bank_ifsc_code'] = this.bankIfscCode;
    data['bank_address'] = this.bankAddress;
    data['initial_deposite_status'] = this.initialDepositeStatus;
    data['reason_for_hold'] = this.reasonForHold;
    data['mode_of_deposite'] = this.modeOfDeposite;
    data['deposite_type'] = this.depositeType;
    data['initial_amount'] = this.initialAmount;
    data['initial_deposite_date'] = this.initialDepositeDate;
    data['payement_bank_name'] = this.payementBankName;
    data['cheque_bank_account'] = this.chequeBankAccount;
    data['cheque_number'] = this.chequeNumber;
    data['interested'] = this.interested;
    return data;
  }
}
