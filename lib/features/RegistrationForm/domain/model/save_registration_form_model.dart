import 'package:pbg_app/ExportFile/export_file.dart';

part 'save_registration_form_model.g.dart';

@HiveType(typeId: HiveTypeId.RegistrationFormId)
class SaveRegistrationFormModel extends HiveObject implements Equatable {
  @HiveField(0)
  final String? areaId;
  @HiveField(1)
  final String? mobileNumber;
  @HiveField(2)
  final String? firstName;
  @HiveField(3)
  final String? middleName;
  @HiveField(4)
  final String? lastName;
  @HiveField(5)
  final String? guardianType;
  @HiveField(6)
  final String? guardianName;
  @HiveField(7)
  final String? emailId;
  @HiveField(8)
  final String? propertyCategoryId;
  @HiveField(9)
  final String? propertyClassId;
  @HiveField(10)
  final String? houseNumber;
  @HiveField(11)
  final String? colonySocietyApartment;
  @HiveField(12)
  final String? town;
  @HiveField(13)
  final String? pinCode;
  @HiveField(14)
  final String? societyAllowedMdpe;
  @HiveField(15)
  final String? residentStatus;
  @HiveField(16)
  final String? noOfKitchen;
  @HiveField(17)
  final String? noOfBathroom;
  @HiveField(18)
  final String? existingCookingFuel;
  @HiveField(19)
  final String? noOfFamilyMembers;
  @HiveField(20)
  final String? latitude;
  @HiveField(21)
  final String? longitude;
  @HiveField(22)
  final String? noInitialDepositStatusReason;
  @HiveField(23)
  final String? schema;
  @HiveField(24)
  final String? dmaUserName;
  @HiveField(25)
  final String? dmaUserId;
  @HiveField(26)
  final String? ownerConsent;
  @HiveField(27)
  final String? kycDocument1;
  @HiveField(28)
  final String? kycDocument1Number;
  @HiveField(29)
  final String? kycDocument2;
  @HiveField(30)
  final String? kycDocument2Number;
  @HiveField(31)
  final String? kycDocument3;
  @HiveField(32)
  final String? idBackPath1;
  @HiveField(33)
  final String? addBackPath2;
  @HiveField(34)
  final String? nocBackPath3;
  @HiveField(35)
  final String? idFrontPath1;
  @HiveField(36)
  final String? addFrontPath2;
  @HiveField(37)
  final String? nocFrontPath3;
  @HiveField(38)
  final String? uploadCustomerPhoto;
  @HiveField(39)
  final String? uploadHousePhoto;
  @HiveField(40)
  final String? canceledChequePhoto;
  @HiveField(41)
  final String? chequePhoto;
  @HiveField(42)
  final String? customerConsentPhoto;
  @HiveField(43)
  final String? bankNameOfBank;
  @HiveField(44)
  final String? bankAccountNumber;
  @HiveField(45)
  final String? bankIfscCode;
  @HiveField(46)
  final String? bankAddress;
  @HiveField(47)
  final String? initialDepositeStatus;
  @HiveField(48)
  final String? reasonForHold;
  @HiveField(49)
  final String? modeOfDeposite;
  @HiveField(50)
  final String? schemeType;
  @HiveField(51)
  final String? schemeTypeAmount;
  @HiveField(52)
  final String? payementBankName;
  @HiveField(53)
  final String? chequeBankAccount;
  @HiveField(54)
  final String? chequeNumber;
  @HiveField(55)
  final String? registrationType;
  @HiveField(56)
  final String? districtId;
  @HiveField(57)
  final String? chequeDepositDate;
  @HiveField(58)
  final String? kycDocument3Number;
  @HiveField(59)
  final String? acceptConversionPolicy;
  @HiveField(60)
  final String? acceptExtraFittingCost;
  @HiveField(61)
  final String? chequeMicrAccount;
  @HiveField(62)
  final String? buildingNumber;
  @HiveField(63)
  final String? chargeArea;
  @HiveField(64)
  final String? eBillingModel;
  @HiveField(65)
  final String? streetName;
  @HiveField(66)
  final String? ownerConsentText;
  @HiveField(67)
  final String? nearestLandmark;
  @HiveField(68)
  final String? customerConsent;
  @HiveField(69)
  final String? alternateMobile;
  @HiveField(70)
  final String? housePhoto;
  @HiveField(71)
  final String? reasonRegistration;
  bool isSingleServerLoader = false;

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
    this.isSingleServerLoader = false,
  });

  @override
  List<Object?> get props => [
        areaId,
        chequePhoto,
        noOfFamilyMembers,
        propertyClassId,
        noOfBathroom,
        noOfKitchen,
        firstName,
        middleName,
        lastName,
        mobileNumber,
        schema,
        emailId,
        idBackPath1,
        addBackPath2,
        nocBackPath3,
        idFrontPath1,
        addFrontPath2,
        nocFrontPath3,
        canceledChequePhoto,
        customerConsentPhoto,
        bankAccountNumber,
        bankAddress,
        bankIfscCode,
        chequeBankAccount,
        chequeNumber,
        schemeType,
        districtId,
        dmaUserId,
        dmaUserName,
        existingCookingFuel,
        guardianName,
        guardianType,
        houseNumber,
        schemeTypeAmount,
        initialDepositeStatus,
        registrationType,
        kycDocument1,
        kycDocument1Number,
        kycDocument2,
        kycDocument2Number,
        kycDocument3,
        longitude,
        latitude,
        colonySocietyApartment,
        modeOfDeposite,
        bankNameOfBank,
        ownerConsent,
        payementBankName,
        pinCode,
        propertyCategoryId,
        reasonForHold,
        noInitialDepositStatusReason,
        residentStatus,
        societyAllowedMdpe,
        town,
        uploadCustomerPhoto,
        uploadHousePhoto,
        chequeDepositDate,
        kycDocument3Number,
        acceptConversionPolicy,
        acceptExtraFittingCost,
        chequeMicrAccount,
        buildingNumber,
        chargeArea,
        eBillingModel,
        streetName,
        ownerConsentText,
        nearestLandmark,
        customerConsent,
        alternateMobile,
        housePhoto,
        reasonRegistration,
        isSingleServerLoader
      ];

  @override
  bool? get stringify => true;
}
