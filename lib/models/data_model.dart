import 'dart:core';
import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class DataModel {
  @HiveField(0)
  final String crteresterd;
  @HiveField(1)
  final String crarea_id;
  @HiveField(2)
  final String crmobile;
  @HiveField(3)
  final String crfirstname;
  @HiveField(4)
  final String crmiddlename;
  @HiveField(5)
  final String crLastName;
  @HiveField(6)
  final String crFather;
  @HiveField(7)
  final String crGuardian;
  @HiveField(8)
  final String crEmail;
  @HiveField(9)
  final String crPropertyCategory;
  @HiveField(10)
  final String crPropertyClass;
  @HiveField(11)
  final String crHouseNumber;
  @HiveField(12)
  final String crLocality;
  @HiveField(13)
  final String crTown;
  @HiveField(14)
  final String crPincode;

  @HiveField(15)
  final String crDistrict;

  @HiveField(16)
  final String crMDPE;

  @HiveField(17)
  final String crResidentStatus;

  @HiveField(18)
  final String crNOOFKitcen;
  @HiveField(19)
  final String crNoBathroom;

  @HiveField(20)
  final String crExitingCookingFuel;

  @HiveField(21)
  final String crFamilyMember;

  @HiveField(22)
  final String crLat;

  @HiveField(23)
  final String crLog;

  @HiveField(24)
  final String crRemarks;

  //Customer Kyc
  @HiveField(26)
  final String KYCDocument1;
  @HiveField(27)
  final String KYCDocument1NumberText;
  @HiveField(28)
  final String KycImageForSide;

  @HiveField(29)
  final String KycImageBackSide;

  @HiveField(30)
  final String KycBill;
  @HiveField(31)
  final String KYCID;
  @HiveField(32)
  final String KYCNOCFSide;
  @HiveField(33)
  final String KYCNOCEndSide;

  @HiveField(34)
  final String IMGElectricbillF;
  @HiveField(35)
  final String ImgOwnerElectricbillE;

  //CustomerConsent

  @HiveField(36)
  final String imgConsentPhoto;

  @HiveField(37)
  final String cusBillingMode;

  @HiveField(38)
  final String cusBankName;

  @HiveField(39)
  final String cusAccountNumber;

  @HiveField(40)
  final String cusIFSCCode;

  @HiveField(41)
  final String cusBankAdrress;

  @HiveField(42)
  final String conversionPolicy;

  @HiveField(43)
  final String extraFillingCost;

  @HiveField(44)
  final String cancelCheckPhoto;

  //Customer InnerDeposite

  @HiveField(45)
  final String IDPaymentCredit;
  @HiveField(46)
  final String IDDeposteStatus;

  @HiveField(47)
  final String IDMODEofDeposite;
  @HiveField(48)
  final String IDScheemType;

  @HiveField(49)
  final String IDDepositeAmount;

  @HiveField(50)
  final String IDCheckNumber;
  @HiveField(51)
  final String IDcheckDate;
  @HiveField(52)
  final String IDcheckBankName;
  @HiveField(53)
  final String IDcheckBankAccountNumber;
  @HiveField(54)
  final String IDCheckphoto;
  @HiveField(55)
  final String dt;
  @HiveField(56)
  final bool complete;
  @HiveField(57)
  final String imgdoc3;
  @HiveField(58)
  final String imgdocback3;
  @HiveField(59)
  final String HoldReasons;
  @HiveField(60)
  final String DateandTime;
  @HiveField(61)
  final String interesedReasons;
  @HiveField(62)
  final String MICR;
  @HiveField(63)
  final String docID2;
  @HiveField(64)
  final String docNUM2;
  @HiveField(65)
  final String imgCheckPhoto;
  @HiveField(66)
  final String idkey;
  DataModel({
    required this.crteresterd,
    required this.crarea_id,
    required this.crmobile,
    required this.crfirstname,
    required this.crmiddlename,
    required this.crLastName,
    required this.crFather,
    required this.crGuardian,
    required this.crEmail,
    required this.crPropertyCategory,
    required this.crPropertyClass,
    required this.crHouseNumber,
    required this.crLocality,
    required this.crTown,
    required this.crPincode,
    required this.crDistrict,
    required this.crMDPE,
    required this.crResidentStatus,
    required this.crNOOFKitcen,
    required this.crNoBathroom,
    required this.crExitingCookingFuel,
    required this.crFamilyMember,
    required this.crLat,
    required this.crLog,
    required this.crRemarks,
    required this.KYCDocument1,
    required this.KYCDocument1NumberText,
    required this.KycImageForSide,
    required this.KycImageBackSide,
    required this.KycBill,
    required this.KYCID,
    required this.KYCNOCFSide,
    required this.KYCNOCEndSide,
    required this.IMGElectricbillF,
    required this.ImgOwnerElectricbillE,
    required this.imgConsentPhoto,
    required this.cusBillingMode,
    required this.cusBankName,
    required this.cusAccountNumber,
    required this.cusIFSCCode,
    required this.cusBankAdrress,
    required this.conversionPolicy,
    required this.extraFillingCost,
    required this.cancelCheckPhoto,
    required this.IDPaymentCredit,
    required this.IDDeposteStatus,
    required this.IDMODEofDeposite,
    required this.IDScheemType,
    required this.IDDepositeAmount,
    required this.IDCheckNumber,
    required this.IDcheckDate,
    required this.IDcheckBankName,
    required this.IDcheckBankAccountNumber,
    required this.IDCheckphoto,
    required this.dt,
    required this.complete,
    required this.imgdoc3,
    required this.imgdocback3,
    required this.HoldReasons,
    required this.DateandTime,
    required this.interesedReasons,
    required this.MICR,
    required this.docID2,
    required this.docNUM2,
    required this.imgCheckPhoto,
    required this.idkey,
  });
}
