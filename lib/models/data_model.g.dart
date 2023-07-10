// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 0;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      crteresterd: fields[0] as String,
      crarea_id: fields[1] as String,
      crmobile: fields[2] as String,
      crfirstname: fields[3] as String,
      crmiddlename: fields[4] as String,
      crLastName: fields[5] as String,
      crFather: fields[6] as String,
      crGuardian: fields[7] as String,
      crEmail: fields[8] as String,
      crPropertyCategory: fields[9] as String,
      crPropertyClass: fields[10] as String,
      crHouseNumber: fields[11] as String,
      crLocality: fields[12] as String,
      crTown: fields[13] as String,
      crPincode: fields[14] as String,
      crDistrict: fields[15] as String,
      crMDPE: fields[16] as String,
      crResidentStatus: fields[17] as String,
      crNOOFKitcen: fields[18] as String,
      crNoBathroom: fields[19] as String,
      crExitingCookingFuel: fields[20] as String,
      crFamilyMember: fields[21] as String,
      crLat: fields[22] as String,
      crLog: fields[23] as String,
      crRemarks: fields[24] as String,
      KYCDocument1: fields[26] as String,
      KYCDocument1NumberText: fields[27] as String,
      KycImageForSide: fields[28] as String,
      KycImageBackSide: fields[29] as String,
      KycBill: fields[30] as String,
      KYCID: fields[31] as String,
      KYCNOCFSide: fields[32] as String,
      KYCNOCEndSide: fields[33] as String,
      IMGElectricbillF: fields[34] as String,
      ImgOwnerElectricbillE: fields[35] as String,
      imgConsentPhoto: fields[36] as String,
      cusBillingMode: fields[37] as String,
      cusBankName: fields[38] as String,
      cusAccountNumber: fields[39] as String,
      cusIFSCCode: fields[40] as String,
      cusBankAdrress: fields[41] as String,
      conversionPolicy: fields[42] as String,
      extraFillingCost: fields[43] as String,
      cancelCheckPhoto: fields[44] as String,
      IDPaymentCredit: fields[45] as String,
      IDDeposteStatus: fields[46] as String,
      IDMODEofDeposite: fields[47] as String,
      IDScheemType: fields[48] as String,
      IDDepositeAmount: fields[49] as String,
      IDCheckNumber: fields[50] as String,
      IDcheckDate: fields[51] as String,
      IDcheckBankName: fields[52] as String,
      IDcheckBankAccountNumber: fields[53] as String,
      IDCheckphoto: fields[54] as String,
      dt: fields[55] as String,
      complete: fields[56] as bool,
      imgdoc3: fields[57] as String,
      imgdocback3: fields[58] as String,
      HoldReasons: fields[59] as String,
      DateandTime: fields[60] as String,
      interesedReasons: fields[61] as String,
      MICR: fields[62] as String,
      docID2: fields[63] as String,
      docNUM2: fields[64] as String,
      imgCheckPhoto: fields[65] as String,
      idkey: fields[66] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(66)
      ..writeByte(0)
      ..write(obj.crteresterd)
      ..writeByte(1)
      ..write(obj.crarea_id)
      ..writeByte(2)
      ..write(obj.crmobile)
      ..writeByte(3)
      ..write(obj.crfirstname)
      ..writeByte(4)
      ..write(obj.crmiddlename)
      ..writeByte(5)
      ..write(obj.crLastName)
      ..writeByte(6)
      ..write(obj.crFather)
      ..writeByte(7)
      ..write(obj.crGuardian)
      ..writeByte(8)
      ..write(obj.crEmail)
      ..writeByte(9)
      ..write(obj.crPropertyCategory)
      ..writeByte(10)
      ..write(obj.crPropertyClass)
      ..writeByte(11)
      ..write(obj.crHouseNumber)
      ..writeByte(12)
      ..write(obj.crLocality)
      ..writeByte(13)
      ..write(obj.crTown)
      ..writeByte(14)
      ..write(obj.crPincode)
      ..writeByte(15)
      ..write(obj.crDistrict)
      ..writeByte(16)
      ..write(obj.crMDPE)
      ..writeByte(17)
      ..write(obj.crResidentStatus)
      ..writeByte(18)
      ..write(obj.crNOOFKitcen)
      ..writeByte(19)
      ..write(obj.crNoBathroom)
      ..writeByte(20)
      ..write(obj.crExitingCookingFuel)
      ..writeByte(21)
      ..write(obj.crFamilyMember)
      ..writeByte(22)
      ..write(obj.crLat)
      ..writeByte(23)
      ..write(obj.crLog)
      ..writeByte(24)
      ..write(obj.crRemarks)
      ..writeByte(26)
      ..write(obj.KYCDocument1)
      ..writeByte(27)
      ..write(obj.KYCDocument1NumberText)
      ..writeByte(28)
      ..write(obj.KycImageForSide)
      ..writeByte(29)
      ..write(obj.KycImageBackSide)
      ..writeByte(30)
      ..write(obj.KycBill)
      ..writeByte(31)
      ..write(obj.KYCID)
      ..writeByte(32)
      ..write(obj.KYCNOCFSide)
      ..writeByte(33)
      ..write(obj.KYCNOCEndSide)
      ..writeByte(34)
      ..write(obj.IMGElectricbillF)
      ..writeByte(35)
      ..write(obj.ImgOwnerElectricbillE)
      ..writeByte(36)
      ..write(obj.imgConsentPhoto)
      ..writeByte(37)
      ..write(obj.cusBillingMode)
      ..writeByte(38)
      ..write(obj.cusBankName)
      ..writeByte(39)
      ..write(obj.cusAccountNumber)
      ..writeByte(40)
      ..write(obj.cusIFSCCode)
      ..writeByte(41)
      ..write(obj.cusBankAdrress)
      ..writeByte(42)
      ..write(obj.conversionPolicy)
      ..writeByte(43)
      ..write(obj.extraFillingCost)
      ..writeByte(44)
      ..write(obj.cancelCheckPhoto)
      ..writeByte(45)
      ..write(obj.IDPaymentCredit)
      ..writeByte(46)
      ..write(obj.IDDeposteStatus)
      ..writeByte(47)
      ..write(obj.IDMODEofDeposite)
      ..writeByte(48)
      ..write(obj.IDScheemType)
      ..writeByte(49)
      ..write(obj.IDDepositeAmount)
      ..writeByte(50)
      ..write(obj.IDCheckNumber)
      ..writeByte(51)
      ..write(obj.IDcheckDate)
      ..writeByte(52)
      ..write(obj.IDcheckBankName)
      ..writeByte(53)
      ..write(obj.IDcheckBankAccountNumber)
      ..writeByte(54)
      ..write(obj.IDCheckphoto)
      ..writeByte(55)
      ..write(obj.dt)
      ..writeByte(56)
      ..write(obj.complete)
      ..writeByte(57)
      ..write(obj.imgdoc3)
      ..writeByte(58)
      ..write(obj.imgdocback3)
      ..writeByte(59)
      ..write(obj.HoldReasons)
      ..writeByte(60)
      ..write(obj.DateandTime)
      ..writeByte(61)
      ..write(obj.interesedReasons)
      ..writeByte(62)
      ..write(obj.MICR)
      ..writeByte(63)
      ..write(obj.docID2)
      ..writeByte(64)
      ..write(obj.docNUM2)
      ..writeByte(65)
      ..write(obj.imgCheckPhoto)
      ..writeByte(66)
      ..write(obj.idkey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
