import 'package:pbg_app/ExportFile/export_file.dart';
part 'save_registration_form_model.g.dart';

@HiveType(typeId: HiveTypeId.RegistrationFormId)

class SaveRegistrationFormModel extends HiveObject{
  @HiveField(0)
  String? areaId;
  @HiveField(1)
  String? mobileNumber;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? middleName;
  @HiveField(4)
  String? lastName;
  @HiveField(5)
  String? guardianType;
  @HiveField(6)
  String? guardianName;
  @HiveField(7)
  String? emailId;
  @HiveField(8)
  String? propertyCategoryId;
  @HiveField(9)
  String? propertyClassId;
  @HiveField(10)
  String? houseNumber;
  @HiveField(11)
  String? colonySocietyApartment;
  @HiveField(12)
  String? town;
  @HiveField(13)
  String? pinCode;
  @HiveField(14)
  String? societyAllowedMdpe;
  @HiveField(15)
  String? residentStatus;
  @HiveField(16)
  String? noOfKitchen;
  @HiveField(17)
  String? noOfBathroom;
  @HiveField(18)
  String? existingCookingFuel;
  @HiveField(19)
  String? noOfFamilyMembers;
  @HiveField(20)
  String? latitude;
  @HiveField(21)
  String? longitude;
  @HiveField(22)
  String? noInitialDepositStatusReason;
  @HiveField(23)
  String? schema;
  @HiveField(24)
  String? dmaUserName;
  @HiveField(25)
  String? dmaUserId;
  @HiveField(26)
  String? ownerConsent;
  @HiveField(27)
  String? kycDocument1;
  @HiveField(28)
  String? kycDocument1Number;
  @HiveField(29)
  String? kycDocument2;
  @HiveField(30)
  String? kycDocument2Number;
  @HiveField(31)
  String? kycDocument3;
  @HiveField(32)
  String? idBackPath1;
  @HiveField(33)
  String? addBackPath2;
  @HiveField(34)
  String? nocBackPath3;
  @HiveField(35)
  String? idFrontPath1;
  @HiveField(36)
  String? addFrontPath2;
  @HiveField(37)
  String? nocFrontPath3;
  @HiveField(38)
  String? uploadCustomerPhoto;
  @HiveField(39)
  String? uploadHousePhoto;
  @HiveField(40)
  String? canceledChequePhoto;
  @HiveField(41)
  String? chequePhoto;
  @HiveField(42)
  String? customerConsentPhoto;
  @HiveField(43)
  String? bankNameOfBank;
  @HiveField(44)
  String? bankAccountNumber;
  @HiveField(45)
  String? bankIfscCode;
  @HiveField(46)
  String? bankAddress;
  @HiveField(47)
  String? initialDepositeStatus;
  @HiveField(48)
  String? reasonForHold;
  @HiveField(49)
  String? modeOfDeposite;
  @HiveField(50)
  String? schemeType;
  @HiveField(51)
  String? schemeTypeAmount;
  @HiveField(52)
  String? payementBankName;
  @HiveField(53)
  String? chequeBankAccount;
  @HiveField(54)
  String? chequeNumber;
  @HiveField(55)
  String? registrationType;
  @HiveField(56)
  String? districtId;
  @HiveField(57)
  String? chequeDepositDate;
  @HiveField(58)
  String? kycDocument3Number;
  @HiveField(59)
  String? acceptConversionPolicy;
  @HiveField(60)
  String? acceptExtraFittingCost;
  @HiveField(61)
  String? chequeMicrAccount;
  @HiveField(62)
  String? buildingNumber;
  @HiveField(63)
  String? chargeArea;
  @HiveField(64)
  String? eBillingModel;
  @HiveField(65)
  String? streetName;
  @HiveField(66)
  String? ownerConsentText;
  @HiveField(67)
  String? nearestLandmark;
  @HiveField(68)
  String? customerConsent;
  @HiveField(69)
  String? alternateMobile;
  @HiveField(70)
  String? housePhoto;
  @HiveField(71)
  String? reasonRegistration;

  SaveRegistrationFormModel({
    this.areaId,
    this.chequePhoto,
    this.noOfFamilyMembers,
    this.propertyClassId,
    this.noOfBathroom,
    this.noOfKitchen,
    this.firstName,
    this.middleName,
    this.lastName,
    this.mobileNumber,
    this.schema,
    this.emailId,
    this.idBackPath1,
    this.addBackPath2,
    this.nocBackPath3,
    this.idFrontPath1,
    this.addFrontPath2,
    this.nocFrontPath3,
    this.canceledChequePhoto,
    this.customerConsentPhoto,
    this.bankAccountNumber,
    this.bankAddress,
    this.bankIfscCode,
    this.chequeBankAccount,
    this.chequeNumber,
    this.schemeType,
    this.districtId,
    this.dmaUserId,
    this.dmaUserName,
    this.existingCookingFuel,
    this.guardianName,
    this.guardianType,
    this.houseNumber,
    this.schemeTypeAmount,
    this.initialDepositeStatus,
    this.registrationType,
    this.kycDocument1,
    this.kycDocument1Number,
    this.kycDocument2,
    this.kycDocument2Number,
    this.kycDocument3,
    this.longitude,
    this.latitude,
    this.colonySocietyApartment,
    this.modeOfDeposite,
    this.bankNameOfBank,
    this.ownerConsent,
    this.payementBankName,
    this.pinCode,
    this.propertyCategoryId,
    this.reasonForHold,
    this.noInitialDepositStatusReason,
    this.residentStatus,
    this.societyAllowedMdpe,
    this.town,
    this.uploadCustomerPhoto,
    this.uploadHousePhoto,
    this.chequeDepositDate,
    this.kycDocument3Number,
    this.acceptConversionPolicy,
    this.acceptExtraFittingCost,
    this.chequeMicrAccount,
    this.buildingNumber,
    this.chargeArea,
    this.eBillingModel,
    this.streetName,
    this.ownerConsentText,
    this.nearestLandmark,
    this.customerConsent,
    this.alternateMobile,
    this.housePhoto,
    this.reasonRegistration,
  });
}

