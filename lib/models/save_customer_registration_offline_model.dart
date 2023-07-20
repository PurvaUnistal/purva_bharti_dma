import '../ExportFile/export_file.dart';

part 'save_customer_registration_offline_model.g.dart';

@HiveType(typeId: 1,)
class SaveCustomerRegistrationOfflineModel{
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
  String locality;
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
  String backSide1;
  @HiveField(33)
  String backSide2;
  @HiveField(34)
  String backSide3;
  @HiveField(35)
  String documentUploads1;
  @HiveField(36)
  String documentUploads2;
  @HiveField(37)
  String documentUploads3;
  @HiveField(38)
  String uploadCustomerPhoto;
  @HiveField(39)
  String uploadHousePhoto;
  @HiveField(40)
  String canceledCheque;
  @HiveField(41)
  String chequePhoto;
  @HiveField(42)
  String customerConsent;
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
  String idkey;
  @HiveField(63)
  bool complete;
  @HiveField(64)
  String chargeArea;
  @HiveField(65)
  String billingModel;

  SaveCustomerRegistrationOfflineModel({
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
    this.backSide1,
    this.backSide2,
    this.backSide3,
    this.bankAccountNumber,
    this.bankAddress,
    this.bankIfscCode,
    this.canceledCheque,
    this.chequeBankAccount,
    this.chequeNumber,
    this.customerConsent,
    this.depositeType,
    this.districtId,
    this.dmaUserId,
    this.dmaUserName,
    this.documentUploads1,
    this.documentUploads2,
    this.documentUploads3,
    this.existingCookingFuel,
    this.guardianName,
    this.guardianType,
    this.houseNumber,
    this.initialAmount,
    this.initialDepositeStatus,
    this.interested,
    this.kycDocument1,
    this.kycDocument1Number,
    this.kycDocument2,
    this.kycDocument2Number,
    this.kycDocument3,
    this.longitude,
    this.latitude,
    this.locality,
    this.modeOfDeposite,
    this.nameOfBank,
    this.ownerConsent,
    this.payementBankName,
    this.pinCode,
    this.propertyCategoryId,
    this.reasonForHold,
    this.remarks,
    this.residentStatus,
    this.societyAllowedMdpe,
    this.town,
    this.uploadCustomerPhoto,
    this.uploadHousePhoto,
    this.initialDepositeDate,
    this.kycDocument3Number,
    this.acceptConversionPolicy,
    this.acceptExtraFittingCost,
    this.micr,
    this.idkey,
    this.complete,
    this.chargeArea,
    this.billingModel,

  });
}