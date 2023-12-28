// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_customer_registration_offline_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveCustomerRegistrationOfflineModelAdapter
    extends TypeAdapter<SaveCustomerRegistrationOfflineModel> {
  @override
  final int typeId = 1;

  @override
  SaveCustomerRegistrationOfflineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveCustomerRegistrationOfflineModel(
      areaId: fields[0] as String,
      mobileNumber: fields[1] as String,
      firstName: fields[2] as String,
      middleName: fields[3] as String,
      lastName: fields[4] as String,
      guardianType: fields[5] as String,
      guardianName: fields[6] as String,
      emailId: fields[7] as String,
      propertyCategoryId: fields[8] as String,
      propertyClassId: fields[9] as String,
      houseNumber: fields[10] as String,
      colonySocietyApartment: fields[11] as String,
      town: fields[12] as String,
      pinCode: fields[13] as String,
      societyAllowedMdpe: fields[14] as String,
      residentStatus: fields[15] as String,
      noOfKitchen: fields[16] as String,
      noOfBathroom: fields[17] as String,
      existingCookingFuel: fields[18] as String,
      noOfFamilyMembers: fields[19] as String,
      latitude: fields[20] as String,
      longitude: fields[21] as String,
      remarks: fields[22] as String,
      schema: fields[23] as String,
      dmaUserName: fields[24] as String,
      dmaUserId: fields[25] as String,
      ownerConsent: fields[26] as String,
      kycDocument1: fields[27] as String,
      kycDocument1Number: fields[28] as String,
      kycDocument2: fields[29] as String,
      kycDocument2Number: fields[30] as String,
      kycDocument3: fields[31] as String,
      backSidePhoto1: fields[32] as String,
      backSidePhoto2: fields[33] as String,
      backSidePhoto3: fields[34] as String,
      documentUploadsPhoto1: fields[35] as String,
      documentUploadsPhoto2: fields[36] as String,
      documentUploadsPhoto3: fields[37] as String,
      uploadCustomerPhoto: fields[38] as String,
      uploadHousePhoto: fields[39] as String,
      canceledChequePhoto: fields[40] as String,
      chequePhoto: fields[41] as String,
      customerConsentPhoto: fields[42] as String,
      nameOfBank: fields[43] as String,
      bankAccountNumber: fields[44] as String,
      bankIfscCode: fields[45] as String,
      bankAddress: fields[46] as String,
      initialDepositeStatus: fields[47] as String,
      reasonForHold: fields[48] as String,
      modeOfDeposite: fields[49] as String,
      depositeType: fields[50] as String,
      initialAmount: fields[51] as String,
      payementBankName: fields[52] as String,
      chequeBankAccount: fields[53] as String,
      chequeNumber: fields[54] as String,
      interested: fields[55] as String,
      districtId: fields[56] as String,
      initialDepositeDate: fields[57] as String,
      kycDocument3Number: fields[58] as String,
      acceptConversionPolicy: fields[59] as String,
      acceptExtraFittingCost: fields[60] as String,
      micr: fields[61] as String,
      modeDepositValue: fields[62] as String,
      buildingNumber: fields[63] as String,
      chargeArea: fields[64] as String,
      billingModel: fields[65] as String,
      streetName: fields[66] as String,
      ownerConsentText: fields[67] as String,
      isDepositCheq: fields[68] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SaveCustomerRegistrationOfflineModel obj) {
    writer
      ..writeByte(69)
      ..writeByte(0)
      ..write(obj.areaId)
      ..writeByte(1)
      ..write(obj.mobileNumber)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.middleName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.guardianType)
      ..writeByte(6)
      ..write(obj.guardianName)
      ..writeByte(7)
      ..write(obj.emailId)
      ..writeByte(8)
      ..write(obj.propertyCategoryId)
      ..writeByte(9)
      ..write(obj.propertyClassId)
      ..writeByte(10)
      ..write(obj.houseNumber)
      ..writeByte(11)
      ..write(obj.colonySocietyApartment)
      ..writeByte(12)
      ..write(obj.town)
      ..writeByte(13)
      ..write(obj.pinCode)
      ..writeByte(14)
      ..write(obj.societyAllowedMdpe)
      ..writeByte(15)
      ..write(obj.residentStatus)
      ..writeByte(16)
      ..write(obj.noOfKitchen)
      ..writeByte(17)
      ..write(obj.noOfBathroom)
      ..writeByte(18)
      ..write(obj.existingCookingFuel)
      ..writeByte(19)
      ..write(obj.noOfFamilyMembers)
      ..writeByte(20)
      ..write(obj.latitude)
      ..writeByte(21)
      ..write(obj.longitude)
      ..writeByte(22)
      ..write(obj.remarks)
      ..writeByte(23)
      ..write(obj.schema)
      ..writeByte(24)
      ..write(obj.dmaUserName)
      ..writeByte(25)
      ..write(obj.dmaUserId)
      ..writeByte(26)
      ..write(obj.ownerConsent)
      ..writeByte(27)
      ..write(obj.kycDocument1)
      ..writeByte(28)
      ..write(obj.kycDocument1Number)
      ..writeByte(29)
      ..write(obj.kycDocument2)
      ..writeByte(30)
      ..write(obj.kycDocument2Number)
      ..writeByte(31)
      ..write(obj.kycDocument3)
      ..writeByte(32)
      ..write(obj.backSidePhoto1)
      ..writeByte(33)
      ..write(obj.backSidePhoto2)
      ..writeByte(34)
      ..write(obj.backSidePhoto3)
      ..writeByte(35)
      ..write(obj.documentUploadsPhoto1)
      ..writeByte(36)
      ..write(obj.documentUploadsPhoto2)
      ..writeByte(37)
      ..write(obj.documentUploadsPhoto3)
      ..writeByte(38)
      ..write(obj.uploadCustomerPhoto)
      ..writeByte(39)
      ..write(obj.uploadHousePhoto)
      ..writeByte(40)
      ..write(obj.canceledChequePhoto)
      ..writeByte(41)
      ..write(obj.chequePhoto)
      ..writeByte(42)
      ..write(obj.customerConsentPhoto)
      ..writeByte(43)
      ..write(obj.nameOfBank)
      ..writeByte(44)
      ..write(obj.bankAccountNumber)
      ..writeByte(45)
      ..write(obj.bankIfscCode)
      ..writeByte(46)
      ..write(obj.bankAddress)
      ..writeByte(47)
      ..write(obj.initialDepositeStatus)
      ..writeByte(48)
      ..write(obj.reasonForHold)
      ..writeByte(49)
      ..write(obj.modeOfDeposite)
      ..writeByte(50)
      ..write(obj.depositeType)
      ..writeByte(51)
      ..write(obj.initialAmount)
      ..writeByte(52)
      ..write(obj.payementBankName)
      ..writeByte(53)
      ..write(obj.chequeBankAccount)
      ..writeByte(54)
      ..write(obj.chequeNumber)
      ..writeByte(55)
      ..write(obj.interested)
      ..writeByte(56)
      ..write(obj.districtId)
      ..writeByte(57)
      ..write(obj.initialDepositeDate)
      ..writeByte(58)
      ..write(obj.kycDocument3Number)
      ..writeByte(59)
      ..write(obj.acceptConversionPolicy)
      ..writeByte(60)
      ..write(obj.acceptExtraFittingCost)
      ..writeByte(61)
      ..write(obj.micr)
      ..writeByte(62)
      ..write(obj.modeDepositValue)
      ..writeByte(63)
      ..write(obj.buildingNumber)
      ..writeByte(64)
      ..write(obj.chargeArea)
      ..writeByte(65)
      ..write(obj.billingModel)
      ..writeByte(66)
      ..write(obj.streetName)
      ..writeByte(67)
      ..write(obj.ownerConsentText)
      ..writeByte(68)
      ..write(obj.isDepositCheq);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveCustomerRegistrationOfflineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
