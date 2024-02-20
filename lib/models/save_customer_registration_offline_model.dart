import '../ExportFile/export_file.dart';

part 'save_customer_registration_offline_model.g.dart';

@HiveType(
  typeId: 1,
)
class SaveCustomerRegistrationOfflineModel {
  @HiveField(0)
  String areaId;
  @HiveField(1)
  String mobileNumber;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String middleName;
  @HiveField(4)
  String lastName;
  @HiveField(5)
  String guardianType;
  @HiveField(6)
  String guardianName;
  @HiveField(7)
  String emailId;
  @HiveField(8)
  String propertyCategoryId;
  @HiveField(9)
  String propertyClassId;
  @HiveField(10)
  String houseNumber;
  @HiveField(11)
  String colonySocietyApartment;
  @HiveField(12)
  String town;
  @HiveField(13)
  String pinCode;
  @HiveField(14)
  String societyAllowedMdpe;
  @HiveField(15)
  String residentStatus;
  @HiveField(16)
  String noOfKitchen;
  @HiveField(17)
  String noOfBathroom;
  @HiveField(18)
  String existingCookingFuel;
  @HiveField(19)
  String noOfFamilyMembers;
  @HiveField(20)
  String latitude;
  @HiveField(21)
  String longitude;
  @HiveField(22)
  String remarks;
  @HiveField(23)
  String schema;
  @HiveField(24)
  String dmaUserName;
  @HiveField(25)
  String dmaUserId;
  @HiveField(26)
  String ownerConsent;
  @HiveField(27)
  String kycDocument1;
  @HiveField(28)
  String kycDocument1Number;
  @HiveField(29)
  String kycDocument2;
  @HiveField(30)
  String kycDocument2Number;
  @HiveField(31)
  String kycDocument3;
  @HiveField(32)
  String backSidePhoto1;
  @HiveField(33)
  String backSidePhoto2;
  @HiveField(34)
  String backSidePhoto3;
  @HiveField(35)
  String documentUploadsPhoto1;
  @HiveField(36)
  String documentUploadsPhoto2;
  @HiveField(37)
  String documentUploadsPhoto3;
  @HiveField(38)
  String uploadCustomerPhoto;
  @HiveField(39)
  String uploadHousePhoto;
  @HiveField(40)
  String canceledChequePhoto;
  @HiveField(41)
  String chequePhoto;
  @HiveField(42)
  String customerConsentPhoto;
  @HiveField(43)
  String nameOfBank;
  @HiveField(44)
  String bankAccountNumber;
  @HiveField(45)
  String bankIfscCode;
  @HiveField(46)
  String bankAddress;
  @HiveField(47)
  String initialDepositeStatus;
  @HiveField(48)
  String reasonForHold;
  @HiveField(49)
  String modeOfDeposite;
  @HiveField(50)
  String depositeType;
  @HiveField(51)
  String initialAmount;
  @HiveField(52)
  String payementBankName;
  @HiveField(53)
  String chequeBankAccount;
  @HiveField(54)
  String chequeNumber;
  @HiveField(55)
  String interested;
  @HiveField(56)
  String districtId;
  @HiveField(57)
  String initialDepositeDate;
  @HiveField(58)
  String kycDocument3Number;
  @HiveField(59)
  String acceptConversionPolicy;
  @HiveField(60)
  String acceptExtraFittingCost;
  @HiveField(61)
  String micr;
  @HiveField(62)
  String? modeDepositValue;
  @HiveField(63)
  String buildingNumber;
  @HiveField(64)
  String chargeArea;
  @HiveField(65)
  String billingModel;
  @HiveField(66)
  String streetName;
  @HiveField(67)
  String? ownerConsentText;
  @HiveField(68)
  bool isDepositCheq;

  SaveCustomerRegistrationOfflineModel({
    required this.areaId,
    required this.chequePhoto,
    required this.noOfFamilyMembers,
    required this.propertyClassId,
    required this.noOfBathroom,
    required this.noOfKitchen,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.mobileNumber,
    required this.schema,
    required this.emailId,
    required this.backSidePhoto1,
    required this.backSidePhoto2,
    required this.backSidePhoto3,
    required this.documentUploadsPhoto1,
    required this.documentUploadsPhoto2,
    required this.documentUploadsPhoto3,
    required this.canceledChequePhoto,
    required this.customerConsentPhoto,
    required this.bankAccountNumber,
    required this.bankAddress,
    required this.bankIfscCode,
    required this.chequeBankAccount,
    required this.chequeNumber,
    required this.depositeType,
    required this.districtId,
    required this.dmaUserId,
    required this.dmaUserName,
    required this.existingCookingFuel,
    required this.guardianName,
    required this.guardianType,
    required this.houseNumber,
    required this.initialAmount,
    required this.initialDepositeStatus,
    required this.interested,
    required this.kycDocument1,
    required this.kycDocument1Number,
    required this.kycDocument2,
    required this.kycDocument2Number,
    required this.kycDocument3,
    required this.longitude,
    required this.latitude,
    required this.colonySocietyApartment,
    required this.modeOfDeposite,
    required this.nameOfBank,
    required this.ownerConsent,
    required this.payementBankName,
    required this.pinCode,
    required this.propertyCategoryId,
    required this.reasonForHold,
    required this.remarks,
    required this.residentStatus,
    required this.societyAllowedMdpe,
    required this.town,
    required this.uploadCustomerPhoto,
    required this.uploadHousePhoto,
    required this.initialDepositeDate,
    required this.kycDocument3Number,
    required this.acceptConversionPolicy,
    required this.acceptExtraFittingCost,
    required this.micr,
    this.modeDepositValue,
    required this.buildingNumber,
    required this.chargeArea,
    required this.billingModel,
    required this.streetName,
    this.ownerConsentText,
    this.isDepositCheq = false,
  });
}
