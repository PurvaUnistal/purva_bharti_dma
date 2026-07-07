import 'package:pbg_app/ExportFile/export_file.dart';

part 'save_registration_form_model.g.dart';

@HiveType(typeId: HiveTypeId.RegistrationFormId)
class SaveRegistrationFormModel extends HiveObject {
  @HiveField(0)
  String? registrationType;

  @HiveField(1)
  String? reasonRegistration;

  @HiveField(2)
  String? acceptConversionPolicy;

  @HiveField(3)
  String? acceptExtraFittingCost;

  @HiveField(4)
  String? societyAllowedMdpe;

  @HiveField(5)
  String? chargeArea;

  @HiveField(6)
  String? areaId;

  @HiveField(7)
  String? nameTitle;

  @HiveField(8)
  String? firstName;

  @HiveField(9)
  String? middleName;

  @HiveField(10)
  String? lastName;

  @HiveField(11)
  String? dob;

  @HiveField(12)
  String? guardianType;

  @HiveField(13)
  String? guardianName;

  @HiveField(14)
  String? emailId;

  @HiveField(15)
  String? mobileNumber;

  @HiveField(16)
  String? alternateMobile;

  @HiveField(17)
  String? propertyCategoryId;

  @HiveField(18)
  String? propertyClassId;

  @HiveField(19)
  String? buildingNumber;

  @HiveField(20)
  String? houseNumber;

  @HiveField(21)
  String? colonySocietyApartment;

  @HiveField(22)
  String? streetName;

  @HiveField(23)
  String? town;

  @HiveField(24)
  String? districtId;

  @HiveField(25)
  String? wardNumber;

  @HiveField(26)
  String? premiseType;

  @HiveField(27)
  String? pinCode;

  @HiveField(28)
  String? noOfKitchen;

  @HiveField(29)
  String? noOfBathroom;

  @HiveField(30)
  String? existingCookingFuel;

  @HiveField(31)
  String? noOfFamilyMembers;

  @HiveField(32)
  String? residentStatus;

  @HiveField(33)
  String? latitude;

  @HiveField(34)
  String? longitude;

  @HiveField(35)
  String? nearestLandmark;

  @HiveField(36)
  String? kycDocument1;

  @HiveField(37)
  String? kycDocument1Number;

  @HiveField(38)
  String? idFrontPath1;

  @HiveField(39)
  String? idBackPath1;

  @HiveField(40)
  String? kycDocument2;

  @HiveField(41)
  String? kycDocument2Number;

  @HiveField(42)
  String? addFrontPath2;

  @HiveField(43)
  String? addBackPath2;

  @HiveField(44)
  String? kycDocument3;

  @HiveField(45)
  String? kycDocument3Number;

  @HiveField(46)
  String? nocDocPath;

  @HiveField(47)
  String? nocFrontPath3;

  @HiveField(48)
  String? nocBackPath3;

  @HiveField(49)
  String? uploadCustomerPhoto;

  @HiveField(50)
  String? uploadHousePhoto;

  @HiveField(51)
  String? customerConsentPhoto;

  @HiveField(52)
  String? ownerConsent;

  @HiveField(53)
  String? canceledChequePhoto;

  @HiveField(54)
  String? chequePhoto;
  @HiveField(55)
  String? initialDepositeStatus;

  @HiveField(56)
  String? reasonDeposit;

  @HiveField(57)
  String? schemeType;

  @HiveField(58)
  String? schemeTypeAmount;

  @HiveField(59)
  String? modeOfDeposite;

  @HiveField(60)
  String? chequeNumber;

  @HiveField(61)
  String? chequeDepositDate;

  @HiveField(62)
  String? chequeBankAccount;

  @HiveField(63)
  String? chequeMicrAccount;

  @HiveField(64)
  String? payementBankName;

  @HiveField(65)
  String? bankAccountNumber;

  @HiveField(66)
  String? bankIfscCode;

  @HiveField(67)
  String? bankAddress;

  @HiveField(68)
  String? bankNameOfBank;

  @HiveField(69)
  String? eBillingModel;

  @HiveField(70)
  String? noInitialDepositStatusReason;

  @HiveField(71)
  String? schema;

  @HiveField(72)
  String? dmaUserName;

  @HiveField(73)
  String? dmaUserId;

  @HiveField(74)
  String? customerConsent;

  @HiveField(75)
  String? houseHoldType;

  @HiveField(76)
  String? meterType;

  @HiveField(77)
  String? floorNumber;

  @HiveField(78)
  String? applicationNumber;

  @HiveField(79)
  String? regFromVal;

  bool isSingleServerLoader = false;

  SaveRegistrationFormModel({
    this.registrationType,
    this.reasonRegistration,
    this.acceptConversionPolicy,
    this.acceptExtraFittingCost,
    this.societyAllowedMdpe,
    this.chargeArea,
    this.areaId,
    this.nameTitle,
    this.firstName,
    this.middleName,
    this.lastName,
    this.dob,
    this.guardianType,
    this.guardianName,
    this.emailId,
    this.mobileNumber,
    this.alternateMobile,
    this.propertyCategoryId,
    this.propertyClassId,
    this.buildingNumber,
    this.houseNumber,
    this.colonySocietyApartment,
    this.streetName,
    this.town,
    this.districtId,
    this.wardNumber,
    this.premiseType,
    this.pinCode,
    this.noOfKitchen,
    this.noOfBathroom,
    this.existingCookingFuel,
    this.noOfFamilyMembers,
    this.residentStatus,
    this.latitude,
    this.longitude,
    this.nearestLandmark,
    this.kycDocument1,
    this.kycDocument1Number,
    this.idFrontPath1,
    this.idBackPath1,
    this.kycDocument2,
    this.kycDocument2Number,
    this.addFrontPath2,
    this.addBackPath2,
    this.kycDocument3,
    this.kycDocument3Number,
    this.nocDocPath,
    this.nocFrontPath3,
    this.nocBackPath3,
    this.uploadCustomerPhoto,
    this.uploadHousePhoto,
    this.customerConsentPhoto,
    this.ownerConsent,
    this.canceledChequePhoto,
    this.chequePhoto,
    this.initialDepositeStatus,
    this.reasonDeposit,
    this.schemeType,
    this.schemeTypeAmount,
    this.modeOfDeposite,
    this.chequeNumber,
    this.chequeDepositDate,
    this.chequeBankAccount,
    this.chequeMicrAccount,
    this.payementBankName,
    this.bankAccountNumber,
    this.bankIfscCode,
    this.bankAddress,
    this.bankNameOfBank,
    this.eBillingModel,
    this.schema,
    this.customerConsent,
    this.houseHoldType,
    this.dmaUserId,
    this.dmaUserName,
    this.noInitialDepositStatusReason,
    this.meterType,
    this.floorNumber,
    this.applicationNumber,
    this.regFromVal,
    this.isSingleServerLoader = false,
  });

  SaveRegistrationFormModel copyWith({
    String? registrationType,
    String? reasonRegistration,
    String? acceptConversionPolicy,
    String? acceptExtraFittingCost,
    String? societyAllowedMdpe,
    String? chargeArea,
    String? areaId,
    String? nameTitle,
    String? firstName,
    String? middleName,
    String? lastName,
    String? dob,
    String? guardianType,
    String? guardianName,
    String? emailId,
    String? mobileNumber,
    String? alternateMobile,
    String? propertyCategoryId,
    String? propertyClassId,
    String? buildingNumber,
    String? houseNumber,
    String? colonySocietyApartment,
    String? streetName,
    String? town,
    String? districtId,
    String? wardNumber,
    String? premiseType,
    String? pinCode,
    String? noOfKitchen,
    String? noOfBathroom,
    String? existingCookingFuel,
    String? noOfFamilyMembers,
    String? residentStatus,
    String? latitude,
    String? longitude,
    String? nearestLandmark,
    String? kycDocument1,
    String? kycDocument1Number,
    String? idFrontPath1,
    String? idBackPath1,
    String? kycDocument2,
    String? kycDocument2Number,
    String? addFrontPath2,
    String? addBackPath2,
    String? kycDocument3,
    String? kycDocument3Number,
    String? nocDocPath,
    String? nocFrontPath3,
    String? nocBackPath3,
    String? uploadCustomerPhoto,
    String? uploadHousePhoto,
    String? customerConsentPhoto,
    String? ownerConsent,
    String? canceledChequePhoto,
    String? chequePhoto,
    String? initialDepositeStatus,
    String? reasonDeposit,
    String? schemeType,
    String? schemeTypeAmount,
    String? modeOfDeposite,
    String? chequeNumber,
    String? chequeDepositDate,
    String? chequeBankAccount,
    String? chequeMicrAccount,
    String? payementBankName,
    String? bankAccountNumber,
    String? bankIfscCode,
    String? bankAddress,
    String? bankNameOfBank,
    String? eBillingModel,
    String? noInitialDepositStatusReason,
    String? schema,
    String? dmaUserName,
    String? dmaUserId,
    String? customerConsent,
    String? houseHoldType,
    String? meterType,
    String? floorNumber,
    String? applicationNumber,
    String? regFromVal,
    bool? isSingleServerLoader,
  }) {
    return SaveRegistrationFormModel(
      registrationType: registrationType ?? this.registrationType,
      reasonRegistration: reasonRegistration ?? this.reasonRegistration,
      acceptConversionPolicy: acceptConversionPolicy ?? this.acceptConversionPolicy,
      acceptExtraFittingCost: acceptExtraFittingCost ?? this.acceptExtraFittingCost,
      societyAllowedMdpe: societyAllowedMdpe ?? this.societyAllowedMdpe,
      chargeArea: chargeArea ?? this.chargeArea,
      areaId: areaId ?? this.areaId,
      nameTitle: nameTitle ?? this.nameTitle,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      guardianType: guardianType ?? this.guardianType,
      guardianName: guardianName ?? this.guardianName,
      emailId: emailId ?? this.emailId,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      alternateMobile: alternateMobile ?? this.alternateMobile,
      propertyCategoryId: propertyCategoryId ?? this.propertyCategoryId,
      propertyClassId: propertyClassId ?? this.propertyClassId,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      houseNumber: houseNumber ?? this.houseNumber,
      colonySocietyApartment: colonySocietyApartment ?? this.colonySocietyApartment,
      streetName: streetName ?? this.streetName,
      town: town ?? this.town,
      districtId: districtId ?? this.districtId,
      wardNumber: wardNumber ?? this.wardNumber,
      premiseType: premiseType ?? this.premiseType,
      pinCode: pinCode ?? this.pinCode,
      noOfKitchen: noOfKitchen ?? this.noOfKitchen,
      noOfBathroom: noOfBathroom ?? this.noOfBathroom,
      existingCookingFuel: existingCookingFuel ?? this.existingCookingFuel,
      noOfFamilyMembers: noOfFamilyMembers ?? this.noOfFamilyMembers,
      residentStatus: residentStatus ?? this.residentStatus,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      nearestLandmark: nearestLandmark ?? this.nearestLandmark,
      kycDocument1: kycDocument1 ?? this.kycDocument1,
      kycDocument1Number: kycDocument1Number ?? this.kycDocument1Number,
      idFrontPath1: idFrontPath1 ?? this.idFrontPath1,
      idBackPath1: idBackPath1 ?? this.idBackPath1,
      kycDocument2: kycDocument2 ?? this.kycDocument2,
      kycDocument2Number: kycDocument2Number ?? this.kycDocument2Number,
      addFrontPath2: addFrontPath2 ?? this.addFrontPath2,
      addBackPath2: addBackPath2 ?? this.addBackPath2,
      kycDocument3: kycDocument3 ?? this.kycDocument3,
      kycDocument3Number: kycDocument3Number ?? this.kycDocument3Number,
      nocDocPath: nocDocPath ?? this.nocDocPath,
      nocFrontPath3: nocFrontPath3 ?? this.nocFrontPath3,
      nocBackPath3: nocBackPath3 ?? this.nocBackPath3,
      uploadCustomerPhoto: uploadCustomerPhoto ?? this.uploadCustomerPhoto,
      uploadHousePhoto: uploadHousePhoto ?? this.uploadHousePhoto,
      customerConsentPhoto: customerConsentPhoto ?? this.customerConsentPhoto,
      ownerConsent: ownerConsent ?? this.ownerConsent,
      canceledChequePhoto: canceledChequePhoto ?? this.canceledChequePhoto,
      chequePhoto: chequePhoto ?? this.chequePhoto,
      initialDepositeStatus: initialDepositeStatus ?? this.initialDepositeStatus,
      reasonDeposit: reasonDeposit ?? this.reasonDeposit,
      schemeType: schemeType ?? this.schemeType,
      schemeTypeAmount: schemeTypeAmount ?? this.schemeTypeAmount,
      modeOfDeposite: modeOfDeposite ?? this.modeOfDeposite,
      chequeNumber: chequeNumber ?? this.chequeNumber,
      chequeDepositDate: chequeDepositDate ?? this.chequeDepositDate,
      chequeBankAccount: chequeBankAccount ?? this.chequeBankAccount,
      chequeMicrAccount: chequeMicrAccount ?? this.chequeMicrAccount,
      payementBankName: payementBankName ?? this.payementBankName,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankIfscCode: bankIfscCode ?? this.bankIfscCode,
      bankAddress: bankAddress ?? this.bankAddress,
      bankNameOfBank: bankNameOfBank ?? this.bankNameOfBank,
      eBillingModel: eBillingModel ?? this.eBillingModel,
      noInitialDepositStatusReason:
      noInitialDepositStatusReason ?? this.noInitialDepositStatusReason,
      schema: schema ?? this.schema,
      dmaUserName: dmaUserName ?? this.dmaUserName,
      dmaUserId: dmaUserId ?? this.dmaUserId,
      customerConsent: customerConsent ?? this.customerConsent,
      houseHoldType: houseHoldType ?? this.houseHoldType,
      meterType: meterType ?? this.meterType,
      floorNumber: floorNumber ?? this.floorNumber,
      applicationNumber: applicationNumber ?? this.applicationNumber,
      regFromVal: regFromVal ?? this.regFromVal,
      isSingleServerLoader: isSingleServerLoader ?? this.isSingleServerLoader,
    );
  }

}