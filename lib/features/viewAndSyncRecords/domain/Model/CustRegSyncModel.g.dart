// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustRegSyncModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustRegSyncAdapter extends TypeAdapter<CustRegSync> {
  @override
  final int typeId = 29;

  @override
  CustRegSync read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustRegSync(
      chequePhoto: fields[72] as String?,
      chequeBankAccount: fields[57] as String?,
      crn: fields[58] as dynamic,
      firstName: fields[7] as String?,
      lastName: fields[9] as String?,
      dmaUserName: fields[10] as String?,
      guardianType: fields[12] as String?,
      marketingApproval: fields[1] as int?,
      markStatusTime: fields[2] as dynamic,
      marketingRejectReason: fields[3] as dynamic,
      dmaUserId: fields[11] as String?,
      dateOfRegistration: fields[4] as DateTime?,
      customerPhoto: fields[73] as String?,
      housePhoto: fields[74] as String?,
      ownerConsent: fields[75] as String?,
      customerConsent: fields[76] as String?,
      backside1: fields[60] as String?,
      backside2: fields[61] as String?,
      canceledCheque: fields[69] as String?,
      backside3: fields[62] as String?,
      acceptConversionPolicy: fields[22] as String?,
      acceptExtraFittingCost: fields[23] as String?,
      kycDocument1Image: fields[66] as String?,
      kycDocument2Image: fields[67] as String?,
      kycDocument3Image: fields[68] as String?,
      districtId: fields[30] as String?,
      modeOfDeposit: fields[50] as String?,
      dmaDirPath: fields[5] as String?,
      schema: fields[6] as String?,
      interested: fields[14] as String?,
      areaId: fields[15] as String?,
      chargeId: fields[16] as String?,
      mobileNumber: fields[17] as String?,
      alternateMobile: fields[18] as String?,
      middleName: fields[8] as String?,
      guardianName: fields[13] as String?,
      emailId: fields[19] as String?,
      propertyCategoryId: fields[20] as String?,
      propertyClassId: fields[21] as String?,
      buildingNumber: fields[24] as String?,
      houseNumber: fields[25] as String?,
      streetName: fields[26] as String?,
      colonySocietyApartment: fields[27] as String?,
      town: fields[28] as String?,
      pinCode: fields[29] as String?,
      societyAllowedMdpe: fields[31] as String?,
      residentStatus: fields[32] as String?,
      noOfBathroom: fields[33] as String?,
      noOfKitchen: fields[34] as String?,
      existingCookingFuel: fields[35] as String?,
      noOfFamilyMembers: fields[36] as String?,
      latitude: fields[37] as String?,
      longitude: fields[38] as String?,
      noInitialDepositStatusReason: fields[39] as String?,
      kycDocument1: fields[40] as String?,
      kycDocument1Number: fields[41] as String?,
      kycDocument2: fields[42] as String?,
      kycDocument2Number: fields[43] as String?,
      kycDocument3: fields[44] as String?,
      kycDocument3Number: fields[45] as String?,
      nameOfBank: fields[46] as String?,
      bankAccountNumber: fields[47] as String?,
      bankIfscCode: fields[48] as String?,
      bankAddress: fields[49] as String?,
      initialDepositStatus: fields[51] as String?,
      nearestLandmark: fields[52] as String?,
      depositType: fields[53] as String?,
      initialAmount: fields[54] as String?,
      chequeNumber: fields[55] as String?,
      paymentBankName: fields[56] as String?,
      micr: fields[59] as String?,
      documentUploads1: fields[63] as String?,
      documentUploads2: fields[64] as String?,
      documentUploads3: fields[65] as String?,
      uploadCustomerPhoto: fields[70] as String?,
      uploadHousePhoto: fields[71] as String?,
      id: fields[0] as int?,
      isDepositChq: fields[78] as bool?,
      eBillingModel: fields[79] as String?,
      chequeDepositDate: fields[80] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustRegSync obj) {
    writer
      ..writeByte(80)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.marketingApproval)
      ..writeByte(2)
      ..write(obj.markStatusTime)
      ..writeByte(3)
      ..write(obj.marketingRejectReason)
      ..writeByte(4)
      ..write(obj.dateOfRegistration)
      ..writeByte(5)
      ..write(obj.dmaDirPath)
      ..writeByte(6)
      ..write(obj.schema)
      ..writeByte(7)
      ..write(obj.firstName)
      ..writeByte(8)
      ..write(obj.middleName)
      ..writeByte(9)
      ..write(obj.lastName)
      ..writeByte(10)
      ..write(obj.dmaUserName)
      ..writeByte(11)
      ..write(obj.dmaUserId)
      ..writeByte(12)
      ..write(obj.guardianType)
      ..writeByte(13)
      ..write(obj.guardianName)
      ..writeByte(14)
      ..write(obj.interested)
      ..writeByte(15)
      ..write(obj.areaId)
      ..writeByte(16)
      ..write(obj.chargeId)
      ..writeByte(17)
      ..write(obj.mobileNumber)
      ..writeByte(18)
      ..write(obj.alternateMobile)
      ..writeByte(19)
      ..write(obj.emailId)
      ..writeByte(20)
      ..write(obj.propertyCategoryId)
      ..writeByte(21)
      ..write(obj.propertyClassId)
      ..writeByte(22)
      ..write(obj.acceptConversionPolicy)
      ..writeByte(23)
      ..write(obj.acceptExtraFittingCost)
      ..writeByte(24)
      ..write(obj.buildingNumber)
      ..writeByte(25)
      ..write(obj.houseNumber)
      ..writeByte(26)
      ..write(obj.streetName)
      ..writeByte(27)
      ..write(obj.colonySocietyApartment)
      ..writeByte(28)
      ..write(obj.town)
      ..writeByte(29)
      ..write(obj.pinCode)
      ..writeByte(30)
      ..write(obj.districtId)
      ..writeByte(31)
      ..write(obj.societyAllowedMdpe)
      ..writeByte(32)
      ..write(obj.residentStatus)
      ..writeByte(33)
      ..write(obj.noOfBathroom)
      ..writeByte(34)
      ..write(obj.noOfKitchen)
      ..writeByte(35)
      ..write(obj.existingCookingFuel)
      ..writeByte(36)
      ..write(obj.noOfFamilyMembers)
      ..writeByte(37)
      ..write(obj.latitude)
      ..writeByte(38)
      ..write(obj.longitude)
      ..writeByte(39)
      ..write(obj.noInitialDepositStatusReason)
      ..writeByte(40)
      ..write(obj.kycDocument1)
      ..writeByte(41)
      ..write(obj.kycDocument1Number)
      ..writeByte(42)
      ..write(obj.kycDocument2)
      ..writeByte(43)
      ..write(obj.kycDocument2Number)
      ..writeByte(44)
      ..write(obj.kycDocument3)
      ..writeByte(45)
      ..write(obj.kycDocument3Number)
      ..writeByte(46)
      ..write(obj.nameOfBank)
      ..writeByte(47)
      ..write(obj.bankAccountNumber)
      ..writeByte(48)
      ..write(obj.bankIfscCode)
      ..writeByte(49)
      ..write(obj.bankAddress)
      ..writeByte(50)
      ..write(obj.modeOfDeposit)
      ..writeByte(51)
      ..write(obj.initialDepositStatus)
      ..writeByte(52)
      ..write(obj.nearestLandmark)
      ..writeByte(53)
      ..write(obj.depositType)
      ..writeByte(54)
      ..write(obj.initialAmount)
      ..writeByte(55)
      ..write(obj.chequeNumber)
      ..writeByte(56)
      ..write(obj.paymentBankName)
      ..writeByte(57)
      ..write(obj.chequeBankAccount)
      ..writeByte(58)
      ..write(obj.crn)
      ..writeByte(59)
      ..write(obj.micr)
      ..writeByte(60)
      ..write(obj.backside1)
      ..writeByte(61)
      ..write(obj.backside2)
      ..writeByte(62)
      ..write(obj.backside3)
      ..writeByte(63)
      ..write(obj.documentUploads1)
      ..writeByte(64)
      ..write(obj.documentUploads2)
      ..writeByte(65)
      ..write(obj.documentUploads3)
      ..writeByte(66)
      ..write(obj.kycDocument1Image)
      ..writeByte(67)
      ..write(obj.kycDocument2Image)
      ..writeByte(68)
      ..write(obj.kycDocument3Image)
      ..writeByte(69)
      ..write(obj.canceledCheque)
      ..writeByte(70)
      ..write(obj.uploadCustomerPhoto)
      ..writeByte(71)
      ..write(obj.uploadHousePhoto)
      ..writeByte(72)
      ..write(obj.chequePhoto)
      ..writeByte(73)
      ..write(obj.customerPhoto)
      ..writeByte(74)
      ..write(obj.housePhoto)
      ..writeByte(75)
      ..write(obj.ownerConsent)
      ..writeByte(76)
      ..write(obj.customerConsent)
      ..writeByte(78)
      ..write(obj.isDepositChq)
      ..writeByte(79)
      ..write(obj.eBillingModel)
      ..writeByte(80)
      ..write(obj.chequeDepositDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustRegSyncAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
