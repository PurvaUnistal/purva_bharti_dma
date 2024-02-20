// class castbyphone {
//   int status;
//   Data data;
//   Kyc kyc;
//   CustomerPhoto customerPhoto;
//   CustomerConsent customerConsent;
//   Deposit deposit;
//   Approval approval;
//
//   castbyphone(
//       {this.status,
//         this.data,
//         this.kyc,
//         this.customerPhoto,
//         this.customerConsent,
//         this.deposit,
//         this.approval});
//
//   castbyphone.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     kyc = json['kyc'] != null ? new Kyc.fromJson(json['kyc']) : null;
//     customerPhoto = json['customer_photo'] != null
//         ? new CustomerPhoto.fromJson(json['customer_photo'])
//         : null;
//     customerConsent = json['customer_consent'] != null
//         ? new CustomerConsent.fromJson(json['customer_consent'])
//         : null;
//     deposit =
//     json['deposit'] != null ? new Deposit.fromJson(json['deposit']) : null;
//     approval = json['approval'] != null
//         ? new Approval.fromJson(json['approval'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     if (this.kyc != null) {
//       data['kyc'] = this.kyc.toJson();
//     }
//     if (this.customerPhoto != null) {
//       data['customer_photo'] = this.customerPhoto.toJson();
//     }
//     if (this.customerConsent != null) {
//       data['customer_consent'] = this.customerConsent.toJson();
//     }
//     if (this.deposit != null) {
//       data['deposit'] = this.deposit.toJson();
//     }
//     if (this.approval != null) {
//       data['approval'] = this.approval.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String firstName;
//   String dmaFormStatus;
//   bool depositEnabled;
//   String crn;
//   String id;
//   String lastName;
//   String interested;
//
//   Data(
//       {this.firstName,
//         this.dmaFormStatus,
//         this.depositEnabled,
//         this.crn,
//         this.id,
//         this.lastName,this.interested});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     firstName = json['first_name'];
//     dmaFormStatus = json['dma_form_status'];
//     depositEnabled = json['deposit_enabled'];
//     crn = json['crn'];
//     id = json['id'];
//     lastName = json['last_name'];
//     interested = json['interested'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first_name'] = this.firstName;
//     data['dma_form_status'] = this.dmaFormStatus;
//     data['deposit_enabled'] = this.depositEnabled;
//     data['crn'] = this.crn;
//     data['id'] = this.id;
//     data['last_name'] = this.lastName;
//     data['interested'] = this.interested;
//     return data;
//   }
// }
//
// class Kyc {
//   String areaId;
//   String areaName;
//   String guardianName;
//   String emailId;
//   String propName;
//   String propertyCategoryId;
//   String propertyClassId;
//   String propClass;
//   String identificationProof;
//   String identificationProofNumber;
//   String identificationFrontImage;
//   String identificationBackImage;
//   String ownershipProof;
//   String ownershipProofNumber;
//   String ownershipFrontImage;
//   String ownershipBackImage;
//   String kycDoc3;
//   String kycDoc3Number;
//   String kycDoc3FrontImage;
//   String kycDoc3BackImage;
//   String houseNumber;
//   String locality;
//   String town;
//   String pinCode;
//   String district;
//   String states;
//   String societyAllowedMdpe;
//   String residentStatus;
//   String noOfKitchen;
//   String noOfBathroom;
//   String existingCookingFuel;
//   String noOfFamilyMembers;
//   String longitude;
//   String latitude;
//   String remarks;
//
//   Kyc(
//       {this.areaId,
//         this.areaName,
//         this.guardianName,
//         this.emailId,
//         this.propName,
//         this.propertyCategoryId,
//         this.propertyClassId,
//         this.propClass,
//         this.identificationProof,
//         this.identificationProofNumber,
//         this.identificationFrontImage,
//         this.identificationBackImage,
//         this.ownershipProof,
//         this.ownershipProofNumber,
//         this.ownershipFrontImage,
//         this.ownershipBackImage,
//         this.kycDoc3,
//         this.kycDoc3Number,
//         this.kycDoc3FrontImage,
//         this.kycDoc3BackImage,
//         this.houseNumber,
//         this.locality,
//         this.town,
//         this.pinCode,
//         this.district,
//         this.states,
//         this.societyAllowedMdpe,
//         this.residentStatus,
//         this.noOfKitchen,
//         this.noOfBathroom,
//         this.existingCookingFuel,
//         this.noOfFamilyMembers,
//         this.longitude,
//         this.latitude,
//         this.remarks});
//
//   Kyc.fromJson(Map<String, dynamic> json) {
//     areaId = json['area_id'];
//     areaName = json['area_name'];
//     guardianName = json['guardian_name'];
//     emailId = json['email_id'];
//     propName = json['prop_name'];
//     propertyCategoryId = json['property_category_id'];
//     propertyClassId = json['property_class_id'];
//     propClass = json['prop_class'];
//     identificationProof = json['identification_proof'];
//     identificationProofNumber = json['identification_proof_number'];
//     identificationFrontImage = json['identification_front_image'];
//     identificationBackImage = json['identification_back_image'];
//     ownershipProof = json['ownership_proof'];
//     ownershipProofNumber = json['ownership_proof_number'];
//     ownershipFrontImage = json['ownership_front_image'];
//     ownershipBackImage = json['ownership_back_image'];
//     kycDoc3 = json['kyc_doc3'];
//     kycDoc3Number = json['kyc_doc3_number'];
//     kycDoc3FrontImage = json['kyc_doc3_front_image'];
//     kycDoc3BackImage = json['kyc_doc3_back_image'];
//     houseNumber = json['house_number'];
//     locality = json['locality'];
//     town = json['town'];
//     pinCode = json['pin_code'];
//     district = json['district'];
//     states = json['states'];
//     societyAllowedMdpe = json['society_allowed_mdpe'];
//     residentStatus = json['resident_status'];
//     noOfKitchen = json['no_of_kitchen'];
//     noOfBathroom = json['no_of_bathroom'];
//     existingCookingFuel = json['existing_cooking_fuel'];
//     noOfFamilyMembers = json['no_of_family_members'];
//     longitude = json['longitude'];
//     latitude = json['latitude'];
//     remarks = json['remarks'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['area_id'] = this.areaId;
//     data['area_name'] = this.areaName;
//     data['guardian_name'] = this.guardianName;
//     data['email_id'] = this.emailId;
//     data['prop_name'] = this.propName;
//     data['property_category_id'] = this.propertyCategoryId;
//     data['property_class_id'] = this.propertyClassId;
//     data['prop_class'] = this.propClass;
//     data['identification_proof'] = this.identificationProof;
//     data['identification_proof_number'] = this.identificationProofNumber;
//     data['identification_front_image'] = this.identificationFrontImage;
//     data['identification_back_image'] = this.identificationBackImage;
//     data['ownership_proof'] = this.ownershipProof;
//     data['ownership_proof_number'] = this.ownershipProofNumber;
//     data['ownership_front_image'] = this.ownershipFrontImage;
//     data['ownership_back_image'] = this.ownershipBackImage;
//     data['kyc_doc3'] = this.kycDoc3;
//     data['kyc_doc3_number'] = this.kycDoc3Number;
//     data['kyc_doc3_front_image'] = this.kycDoc3FrontImage;
//     data['kyc_doc3_back_image'] = this.kycDoc3BackImage;
//     data['house_number'] = this.houseNumber;
//     data['locality'] = this.locality;
//     data['town'] = this.town;
//     data['pin_code'] = this.pinCode;
//     data['district'] = this.district;
//     data['states'] = this.states;
//     data['society_allowed_mdpe'] = this.societyAllowedMdpe;
//     data['resident_status'] = this.residentStatus;
//     data['no_of_kitchen'] = this.noOfKitchen;
//     data['no_of_bathroom'] = this.noOfBathroom;
//     data['existing_cooking_fuel'] = this.existingCookingFuel;
//     data['no_of_family_members'] = this.noOfFamilyMembers;
//     data['longitude'] = this.longitude;
//     data['latitude'] = this.latitude;
//     data['remarks'] = this.remarks;
//     return data;
//   }
// }
//
// class CustomerPhoto {
//   String customerPhoto;
//   String housePhoto;
//
//   CustomerPhoto({this.customerPhoto, this.housePhoto});
//
//   CustomerPhoto.fromJson(Map<String, dynamic> json) {
//     customerPhoto = json['customer_photo'];
//     housePhoto = json['house_photo'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['customer_photo'] = this.customerPhoto;
//     data['house_photo'] = this.housePhoto;
//     return data;
//   }
// }
//
// class CustomerConsent {
//   String preferedBillingMode;
//   String nameOfBank;
//   String bankAccountNumber;
//   String bankIfscCode;
//   String bankAddress;
//   String acceptConversionPolicy;
//   String acceptExtraFittingCost;
//   String canceledCheque;
//   String customerConsent;
//
//   CustomerConsent(
//       {this.preferedBillingMode,
//         this.nameOfBank,
//         this.bankAccountNumber,
//         this.bankIfscCode,
//         this.bankAddress,
//         this.acceptConversionPolicy,
//         this.acceptExtraFittingCost,
//         this.canceledCheque,
//         this.customerConsent});
//
//   CustomerConsent.fromJson(Map<String, dynamic> json) {
//     preferedBillingMode = json['prefered_billing_mode'];
//     nameOfBank = json['name_of_bank'];
//     bankAccountNumber = json['bank_account_number'];
//     bankIfscCode = json['bank_ifsc_code'];
//     bankAddress = json['bank_address'];
//     acceptConversionPolicy = json['accept_conversion_policy'];
//     acceptExtraFittingCost = json['accept_extra_fitting_cost'];
//     canceledCheque = json['canceled_cheque'];
//     customerConsent = json['customer_consent'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['prefered_billing_mode'] = this.preferedBillingMode;
//     data['name_of_bank'] = this.nameOfBank;
//     data['bank_account_number'] = this.bankAccountNumber;
//     data['bank_ifsc_code'] = this.bankIfscCode;
//     data['bank_address'] = this.bankAddress;
//     data['accept_conversion_policy'] = this.acceptConversionPolicy;
//     data['accept_extra_fitting_cost'] = this.acceptExtraFittingCost;
//     data['canceled_cheque'] = this.canceledCheque;
//     data['customer_consent'] = this.customerConsent;
//     return data;
//   }
// }
//
// class Deposit {
//   String initialDepositeStatus;
//   String modeOfDeposite;
//   String depositeType;
//   String initialAmount;
//   String initialDepositeDate;
//   String paymentBankName;
//   String chequeBankAccount;
//   String chequeNumber;
//   String chequePhoto;
//   String depositSlipDate;
//   String depositSlip;
//
//   Deposit(
//       {this.initialDepositeStatus,
//         this.modeOfDeposite,
//         this.depositeType,
//         this.initialAmount,
//         this.initialDepositeDate,
//         this.paymentBankName,
//         this.chequeBankAccount,
//         this.chequeNumber,
//         this.chequePhoto,
//         this.depositSlipDate,
//         this.depositSlip});
//
//   Deposit.fromJson(Map<String, dynamic> json) {
//     initialDepositeStatus = json['initial_deposite_status'];
//     modeOfDeposite = json['mode_of_deposite'];
//     depositeType = json['deposite_type'];
//     initialAmount = json['initial_amount'];
//     initialDepositeDate = json['initial_deposite_date'];
//     paymentBankName = json['payment_bank_name'];
//     chequeBankAccount = json['cheque_bank_account'];
//     chequeNumber = json['cheque_number'];
//     chequePhoto = json['cheque_photo'];
//     depositSlipDate = json['deposit_slip_date'];
//     depositSlip = json['deposit_slip'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['initial_deposite_status'] = this.initialDepositeStatus;
//     data['mode_of_deposite'] = this.modeOfDeposite;
//     data['deposite_type'] = this.depositeType;
//     data['initial_amount'] = this.initialAmount;
//     data['initial_deposite_date'] = this.initialDepositeDate;
//     data['payment_bank_name'] = this.paymentBankName;
//     data['cheque_bank_account'] = this.chequeBankAccount;
//     data['cheque_number'] = this.chequeNumber;
//     data['cheque_photo'] = this.chequePhoto;
//     data['deposit_slip_date'] = this.depositSlipDate;
//     data['deposit_slip'] = this.depositSlip;
//     return data;
//   }
// }
//
// class Approval {
//   String marketingApproval;
//   String markStatusTime;
//   String marketingRejectReason;
//   String accountingApproval;
//   String accountingTime;
//   String accontingRejectReason;
//
//   Approval(
//       {this.marketingApproval,
//         this.markStatusTime,
//         this.marketingRejectReason,
//         this.accountingApproval,
//         this.accountingTime,
//         this.accontingRejectReason});
//
//   Approval.fromJson(Map<String, dynamic> json) {
//     marketingApproval = json['marketing_approval'];
//     markStatusTime = json['mark_status_time'];
//     marketingRejectReason = json['marketing_reject_reason'];
//     accountingApproval = json['accounting_approval'];
//     accountingTime = json['accounting_time'];
//     accontingRejectReason = json['acconting_reject_reason'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['marketing_approval'] = this.marketingApproval;
//     data['mark_status_time'] = this.markStatusTime;
//     data['marketing_reject_reason'] = this.marketingRejectReason;
//     data['accounting_approval'] = this.accountingApproval;
//     data['accounting_time'] = this.accountingTime;
//     data['acconting_reject_reason'] = this.accontingRejectReason;
//     return data;
//   }
// }
