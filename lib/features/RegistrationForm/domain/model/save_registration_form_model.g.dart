// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_registration_form_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveRegistrationFormModelAdapter
    extends TypeAdapter<SaveRegistrationFormModel> {
  @override
  final int typeId = 27;

  @override
  SaveRegistrationFormModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveRegistrationFormModel(
      registrationType: fields[0] as String?,
      reasonRegistration: fields[1] as String?,
      acceptConversionPolicy: fields[2] as String?,
      acceptExtraFittingCost: fields[3] as String?,
      societyAllowedMdpe: fields[4] as String?,
      chargeArea: fields[5] as String?,
      areaId: fields[6] as String?,
      nameTitle: fields[7] as String?,
      firstName: fields[8] as String?,
      middleName: fields[9] as String?,
      lastName: fields[10] as String?,
      dob: fields[11] as String?,
      guardianType: fields[12] as String?,
      guardianName: fields[13] as String?,
      emailId: fields[14] as String?,
      mobileNumber: fields[15] as String?,
      alternateMobile: fields[16] as String?,
      propertyCategoryId: fields[17] as String?,
      propertyClassId: fields[18] as String?,
      buildingNumber: fields[19] as String?,
      houseNumber: fields[20] as String?,
      colonySocietyApartment: fields[21] as String?,
      streetName: fields[22] as String?,
      town: fields[23] as String?,
      districtId: fields[24] as String?,
      wardNumber: fields[25] as String?,
      premiseType: fields[26] as String?,
      pinCode: fields[27] as String?,
      noOfKitchen: fields[28] as String?,
      noOfBathroom: fields[29] as String?,
      existingCookingFuel: fields[30] as String?,
      noOfFamilyMembers: fields[31] as String?,
      residentStatus: fields[32] as String?,
      latitude: fields[33] as String?,
      longitude: fields[34] as String?,
      nearestLandmark: fields[35] as String?,
      kycDocument1: fields[36] as String?,
      kycDocument1Number: fields[37] as String?,
      idFrontPath1: fields[38] as String?,
      idBackPath1: fields[39] as String?,
      kycDocument2: fields[40] as String?,
      kycDocument2Number: fields[41] as String?,
      addFrontPath2: fields[42] as String?,
      addBackPath2: fields[43] as String?,
      kycDocument3: fields[44] as String?,
      kycDocument3Number: fields[45] as String?,
      nocDocPath: fields[46] as String?,
      nocFrontPath3: fields[47] as String?,
      nocBackPath3: fields[48] as String?,
      uploadCustomerPhoto: fields[49] as String?,
      uploadHousePhoto: fields[50] as String?,
      customerConsentPhoto: fields[51] as String?,
      ownerConsent: fields[52] as String?,
      canceledChequePhoto: fields[53] as String?,
      chequePhoto: fields[54] as String?,
      initialDepositeStatus: fields[55] as String?,
      reasonDeposit: fields[56] as String?,
      schemeType: fields[57] as String?,
      schemeTypeAmount: fields[58] as String?,
      modeOfDeposite: fields[59] as String?,
      chequeNumber: fields[60] as String?,
      chequeDepositDate: fields[61] as String?,
      chequeBankAccount: fields[62] as String?,
      chequeMicrAccount: fields[63] as String?,
      payementBankName: fields[64] as String?,
      bankAccountNumber: fields[65] as String?,
      bankIfscCode: fields[66] as String?,
      bankAddress: fields[67] as String?,
      bankNameOfBank: fields[68] as String?,
      eBillingModel: fields[69] as String?,
      schema: fields[71] as String?,
      customerConsent: fields[74] as String?,
      houseHoldType: fields[75] as String?,
      dmaUserId: fields[73] as String?,
      dmaUserName: fields[72] as String?,
      noInitialDepositStatusReason: fields[70] as String?,
      meterType: fields[76] as String?,
      floorNumber: fields[77] as String?,
      applicationNumber: fields[78] as String?,
      regFromVal: fields[79] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SaveRegistrationFormModel obj) {
    writer
      ..writeByte(80)
      ..writeByte(0)
      ..write(obj.registrationType)
      ..writeByte(1)
      ..write(obj.reasonRegistration)
      ..writeByte(2)
      ..write(obj.acceptConversionPolicy)
      ..writeByte(3)
      ..write(obj.acceptExtraFittingCost)
      ..writeByte(4)
      ..write(obj.societyAllowedMdpe)
      ..writeByte(5)
      ..write(obj.chargeArea)
      ..writeByte(6)
      ..write(obj.areaId)
      ..writeByte(7)
      ..write(obj.nameTitle)
      ..writeByte(8)
      ..write(obj.firstName)
      ..writeByte(9)
      ..write(obj.middleName)
      ..writeByte(10)
      ..write(obj.lastName)
      ..writeByte(11)
      ..write(obj.dob)
      ..writeByte(12)
      ..write(obj.guardianType)
      ..writeByte(13)
      ..write(obj.guardianName)
      ..writeByte(14)
      ..write(obj.emailId)
      ..writeByte(15)
      ..write(obj.mobileNumber)
      ..writeByte(16)
      ..write(obj.alternateMobile)
      ..writeByte(17)
      ..write(obj.propertyCategoryId)
      ..writeByte(18)
      ..write(obj.propertyClassId)
      ..writeByte(19)
      ..write(obj.buildingNumber)
      ..writeByte(20)
      ..write(obj.houseNumber)
      ..writeByte(21)
      ..write(obj.colonySocietyApartment)
      ..writeByte(22)
      ..write(obj.streetName)
      ..writeByte(23)
      ..write(obj.town)
      ..writeByte(24)
      ..write(obj.districtId)
      ..writeByte(25)
      ..write(obj.wardNumber)
      ..writeByte(26)
      ..write(obj.premiseType)
      ..writeByte(27)
      ..write(obj.pinCode)
      ..writeByte(28)
      ..write(obj.noOfKitchen)
      ..writeByte(29)
      ..write(obj.noOfBathroom)
      ..writeByte(30)
      ..write(obj.existingCookingFuel)
      ..writeByte(31)
      ..write(obj.noOfFamilyMembers)
      ..writeByte(32)
      ..write(obj.residentStatus)
      ..writeByte(33)
      ..write(obj.latitude)
      ..writeByte(34)
      ..write(obj.longitude)
      ..writeByte(35)
      ..write(obj.nearestLandmark)
      ..writeByte(36)
      ..write(obj.kycDocument1)
      ..writeByte(37)
      ..write(obj.kycDocument1Number)
      ..writeByte(38)
      ..write(obj.idFrontPath1)
      ..writeByte(39)
      ..write(obj.idBackPath1)
      ..writeByte(40)
      ..write(obj.kycDocument2)
      ..writeByte(41)
      ..write(obj.kycDocument2Number)
      ..writeByte(42)
      ..write(obj.addFrontPath2)
      ..writeByte(43)
      ..write(obj.addBackPath2)
      ..writeByte(44)
      ..write(obj.kycDocument3)
      ..writeByte(45)
      ..write(obj.kycDocument3Number)
      ..writeByte(46)
      ..write(obj.nocDocPath)
      ..writeByte(47)
      ..write(obj.nocFrontPath3)
      ..writeByte(48)
      ..write(obj.nocBackPath3)
      ..writeByte(49)
      ..write(obj.uploadCustomerPhoto)
      ..writeByte(50)
      ..write(obj.uploadHousePhoto)
      ..writeByte(51)
      ..write(obj.customerConsentPhoto)
      ..writeByte(52)
      ..write(obj.ownerConsent)
      ..writeByte(53)
      ..write(obj.canceledChequePhoto)
      ..writeByte(54)
      ..write(obj.chequePhoto)
      ..writeByte(55)
      ..write(obj.initialDepositeStatus)
      ..writeByte(56)
      ..write(obj.reasonDeposit)
      ..writeByte(57)
      ..write(obj.schemeType)
      ..writeByte(58)
      ..write(obj.schemeTypeAmount)
      ..writeByte(59)
      ..write(obj.modeOfDeposite)
      ..writeByte(60)
      ..write(obj.chequeNumber)
      ..writeByte(61)
      ..write(obj.chequeDepositDate)
      ..writeByte(62)
      ..write(obj.chequeBankAccount)
      ..writeByte(63)
      ..write(obj.chequeMicrAccount)
      ..writeByte(64)
      ..write(obj.payementBankName)
      ..writeByte(65)
      ..write(obj.bankAccountNumber)
      ..writeByte(66)
      ..write(obj.bankIfscCode)
      ..writeByte(67)
      ..write(obj.bankAddress)
      ..writeByte(68)
      ..write(obj.bankNameOfBank)
      ..writeByte(69)
      ..write(obj.eBillingModel)
      ..writeByte(70)
      ..write(obj.noInitialDepositStatusReason)
      ..writeByte(71)
      ..write(obj.schema)
      ..writeByte(72)
      ..write(obj.dmaUserName)
      ..writeByte(73)
      ..write(obj.dmaUserId)
      ..writeByte(74)
      ..write(obj.customerConsent)
      ..writeByte(75)
      ..write(obj.houseHoldType)
      ..writeByte(76)
      ..write(obj.meterType)
      ..writeByte(77)
      ..write(obj.floorNumber)
      ..writeByte(78)
      ..write(obj.applicationNumber)
      ..writeByte(79)
      ..write(obj.regFromVal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveRegistrationFormModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
