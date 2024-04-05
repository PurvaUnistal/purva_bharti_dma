// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_label_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetLabelModelAdapter extends TypeAdapter<GetLabelModel> {
  @override
  final int typeId = 28;

  @override
  GetLabelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetLabelModel(
      steps: fields[0] as Steps?,
      registration: fields[1] as Registration?,
      inspection: fields[2] as Inspection?,
      photo: fields[3] as Photo?,
      kyc: fields[4] as Kyc?,
      deposit: fields[5] as Deposit?,
      consent: fields[6] as Consent?,
      lmc: fields[7] as Lmc?,
    );
  }

  @override
  void write(BinaryWriter writer, GetLabelModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.steps)
      ..writeByte(1)
      ..write(obj.registration)
      ..writeByte(2)
      ..write(obj.inspection)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.kyc)
      ..writeByte(5)
      ..write(obj.deposit)
      ..writeByte(6)
      ..write(obj.consent)
      ..writeByte(7)
      ..write(obj.lmc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetLabelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConsentAdapter extends TypeAdapter<Consent> {
  @override
  final int typeId = 12;

  @override
  Consent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Consent(
      takePhoto: fields[0] as String,
      custBank: fields[1] as String,
      custAcc: fields[2] as String,
      custIfsc: fields[3] as String,
      custBankAdd: fields[4] as String,
      cancelledPhoto: fields[5] as String,
      preferredBilling: fields[6] as String,
      acceptConversionPolicy: fields[7] as String,
      acceptExtraCost: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Consent obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.takePhoto)
      ..writeByte(1)
      ..write(obj.custBank)
      ..writeByte(2)
      ..write(obj.custAcc)
      ..writeByte(3)
      ..write(obj.custIfsc)
      ..writeByte(4)
      ..write(obj.custBankAdd)
      ..writeByte(5)
      ..write(obj.cancelledPhoto)
      ..writeByte(6)
      ..write(obj.preferredBilling)
      ..writeByte(7)
      ..write(obj.acceptConversionPolicy)
      ..writeByte(8)
      ..write(obj.acceptExtraCost);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DepositAdapter extends TypeAdapter<Deposit> {
  @override
  final int typeId = 13;

  @override
  Deposit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Deposit(
      depositSta: fields[0] as String,
      modeOfDep: fields[1] as String,
      depositDate: fields[2] as String,
      depositType: fields[3] as String,
      depositAmt: fields[4] as String,
      chqNum: fields[5] as String,
      chqBank: fields[6] as String,
      bankAcc: fields[7] as String,
      chqDate: fields[8] as String,
      chqPhoto: fields[9] as String,
      payStatus: fields[10] as String,
      reason: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Deposit obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.depositSta)
      ..writeByte(1)
      ..write(obj.modeOfDep)
      ..writeByte(2)
      ..write(obj.depositDate)
      ..writeByte(3)
      ..write(obj.depositType)
      ..writeByte(4)
      ..write(obj.depositAmt)
      ..writeByte(5)
      ..write(obj.chqNum)
      ..writeByte(6)
      ..write(obj.chqBank)
      ..writeByte(7)
      ..write(obj.bankAcc)
      ..writeByte(8)
      ..write(obj.chqDate)
      ..writeByte(9)
      ..write(obj.chqPhoto)
      ..writeByte(10)
      ..write(obj.payStatus)
      ..writeByte(11)
      ..write(obj.reason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepositAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class InspectionAdapter extends TypeAdapter<Inspection> {
  @override
  final int typeId = 14;

  @override
  Inspection read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Inspection(
      inspectMeter: fields[0] as String,
      inspectRegulator: fields[2] as String,
      inspectOtherFittings: fields[3] as String,
      asPerLmcQty: fields[4] as String,
      customerSatisfication: fields[5] as String,
      conversionAgreement: fields[6] as String,
      photo: fields[7] as String,
      conversionDate: fields[8] as String,
      remarks: fields[9] as String,
      extraPipe: fields[10] as String,
      extraPrice: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Inspection obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.inspectMeter)
      ..writeByte(1)
      ..write(obj.extraPrice)
      ..writeByte(2)
      ..write(obj.inspectRegulator)
      ..writeByte(3)
      ..write(obj.inspectOtherFittings)
      ..writeByte(4)
      ..write(obj.asPerLmcQty)
      ..writeByte(5)
      ..write(obj.customerSatisfication)
      ..writeByte(6)
      ..write(obj.conversionAgreement)
      ..writeByte(7)
      ..write(obj.photo)
      ..writeByte(8)
      ..write(obj.conversionDate)
      ..writeByte(9)
      ..write(obj.remarks)
      ..writeByte(10)
      ..write(obj.extraPipe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InspectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class KycAdapter extends TypeAdapter<Kyc> {
  @override
  final int typeId = 15;

  @override
  Kyc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Kyc(
      uploadDoc1: fields[0] as String,
      uploadDoc1No: fields[1] as String,
      uploadDoc1Front: fields[2] as String,
      uploadDoc1Back: fields[3] as String,
      selectDoc: fields[4] as String,
      uploadDoc2: fields[5] as String,
      uploadDoc2No: fields[6] as String,
      uploadDoc2Front: fields[7] as String,
      uploadDoc2Back: fields[8] as String,
      uploadDoc3: fields[9] as String,
      uploadDoc3No: fields[10] as String,
      uploadDoc3Front: fields[11] as String,
      uploadDoc3Back: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Kyc obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.uploadDoc1)
      ..writeByte(1)
      ..write(obj.uploadDoc1No)
      ..writeByte(2)
      ..write(obj.uploadDoc1Front)
      ..writeByte(3)
      ..write(obj.uploadDoc1Back)
      ..writeByte(4)
      ..write(obj.selectDoc)
      ..writeByte(5)
      ..write(obj.uploadDoc2)
      ..writeByte(6)
      ..write(obj.uploadDoc2No)
      ..writeByte(7)
      ..write(obj.uploadDoc2Front)
      ..writeByte(8)
      ..write(obj.uploadDoc2Back)
      ..writeByte(9)
      ..write(obj.uploadDoc3)
      ..writeByte(10)
      ..write(obj.uploadDoc3No)
      ..writeByte(11)
      ..write(obj.uploadDoc3Front)
      ..writeByte(12)
      ..write(obj.uploadDoc3Back);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KycAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LmcAdapter extends TypeAdapter<Lmc> {
  @override
  final int typeId = 16;

  @override
  Lmc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lmc(
      feasibilityDate: fields[0] as String,
      proposedDate: fields[1] as String,
      additional: fields[2] as String,
      material: fields[3] as String,
      qty: fields[4] as String,
      regulators: fields[5] as String,
      installation: fields[6] as String,
      feasibility: fields[7] as String,
      workStart: fields[8] as String,
      reasonIfDelay: fields[9] as String,
      reason: fields[10] as String,
      isFeasible: fields[11] as String,
      followUpDate: fields[12] as String,
      meterNumber: fields[13] as String,
      pipe: fields[14] as String,
      fitting: fields[15] as String,
      meterInitialReading: fields[16] as String,
      readingDate: fields[17] as String,
      meterPhoto: fields[18] as String,
      tfNumber: fields[19] as String,
      latitudeTf: fields[20] as String,
      longitudeTf: fields[21] as String,
      latitudeHg: fields[22] as String,
      longitudeHg: fields[23] as String,
      workCompletedDate: fields[24] as String,
      workCompletedImage: fields[25] as String,
      ackDate: fields[26] as String,
      ackImage: fields[27] as String,
      conversionDate: fields[28] as String,
      typeNr: fields[29] as String,
      isCustomerReady: fields[30] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Lmc obj) {
    writer
      ..writeByte(31)
      ..writeByte(0)
      ..write(obj.feasibilityDate)
      ..writeByte(1)
      ..write(obj.proposedDate)
      ..writeByte(2)
      ..write(obj.additional)
      ..writeByte(3)
      ..write(obj.material)
      ..writeByte(4)
      ..write(obj.qty)
      ..writeByte(5)
      ..write(obj.regulators)
      ..writeByte(6)
      ..write(obj.installation)
      ..writeByte(7)
      ..write(obj.feasibility)
      ..writeByte(8)
      ..write(obj.workStart)
      ..writeByte(9)
      ..write(obj.reasonIfDelay)
      ..writeByte(10)
      ..write(obj.reason)
      ..writeByte(11)
      ..write(obj.isFeasible)
      ..writeByte(12)
      ..write(obj.followUpDate)
      ..writeByte(13)
      ..write(obj.meterNumber)
      ..writeByte(14)
      ..write(obj.pipe)
      ..writeByte(15)
      ..write(obj.fitting)
      ..writeByte(16)
      ..write(obj.meterInitialReading)
      ..writeByte(17)
      ..write(obj.readingDate)
      ..writeByte(18)
      ..write(obj.meterPhoto)
      ..writeByte(19)
      ..write(obj.tfNumber)
      ..writeByte(20)
      ..write(obj.latitudeTf)
      ..writeByte(21)
      ..write(obj.longitudeTf)
      ..writeByte(22)
      ..write(obj.latitudeHg)
      ..writeByte(23)
      ..write(obj.longitudeHg)
      ..writeByte(24)
      ..write(obj.workCompletedDate)
      ..writeByte(25)
      ..write(obj.workCompletedImage)
      ..writeByte(26)
      ..write(obj.ackDate)
      ..writeByte(27)
      ..write(obj.ackImage)
      ..writeByte(28)
      ..write(obj.conversionDate)
      ..writeByte(29)
      ..write(obj.typeNr)
      ..writeByte(30)
      ..write(obj.isCustomerReady);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LmcAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhotoAdapter extends TypeAdapter<Photo> {
  @override
  final int typeId = 17;

  @override
  Photo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Photo(
      customerPhoto: fields[0] as String,
      homePhoto: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Photo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.customerPhoto)
      ..writeByte(1)
      ..write(obj.homePhoto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RegistrationAdapter extends TypeAdapter<Registration> {
  @override
  final int typeId = 18;

  @override
  Registration read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Registration(
      registrationType: fields[0] as String,
      chargeArea: fields[1] as String,
      area: fields[2] as String,
      lastname: fields[3] as String,
      guardian: fields[4] as String,
      email: fields[5] as String,
      propertyCategory: fields[6] as String,
      propertyClass: fields[7] as String,
      house: fields[8] as String,
      locality: fields[9] as String,
      town: fields[10] as String,
      pincode: fields[11] as String,
      district: fields[12] as String,
      mdpe: fields[13] as String,
      resident: fields[14] as String,
      kitchen: fields[15] as String,
      bathroom: fields[16] as String,
      fuel: fields[17] as String,
      family: fields[18] as String,
      location: fields[19] as String,
      long: fields[20] as String,
      lat: fields[21] as String,
      getLoc: fields[22] as String,
      remarks: fields[23] as String,
      submit: fields[24] as String,
      guardianType: fields[25] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Registration obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.registrationType)
      ..writeByte(1)
      ..write(obj.chargeArea)
      ..writeByte(2)
      ..write(obj.area)
      ..writeByte(3)
      ..write(obj.lastname)
      ..writeByte(4)
      ..write(obj.guardian)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.propertyCategory)
      ..writeByte(7)
      ..write(obj.propertyClass)
      ..writeByte(8)
      ..write(obj.house)
      ..writeByte(9)
      ..write(obj.locality)
      ..writeByte(10)
      ..write(obj.town)
      ..writeByte(11)
      ..write(obj.pincode)
      ..writeByte(12)
      ..write(obj.district)
      ..writeByte(13)
      ..write(obj.mdpe)
      ..writeByte(14)
      ..write(obj.resident)
      ..writeByte(15)
      ..write(obj.kitchen)
      ..writeByte(16)
      ..write(obj.bathroom)
      ..writeByte(17)
      ..write(obj.fuel)
      ..writeByte(18)
      ..write(obj.family)
      ..writeByte(19)
      ..write(obj.location)
      ..writeByte(20)
      ..write(obj.long)
      ..writeByte(21)
      ..write(obj.lat)
      ..writeByte(22)
      ..write(obj.getLoc)
      ..writeByte(23)
      ..write(obj.remarks)
      ..writeByte(24)
      ..write(obj.submit)
      ..writeByte(25)
      ..write(obj.guardianType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StepsAdapter extends TypeAdapter<Steps> {
  @override
  final int typeId = 19;

  @override
  Steps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Steps(
      reg: fields[0] as String,
      kyc: fields[1] as String,
      photo: fields[2] as String,
      consent: fields[3] as String,
      deposit: fields[4] as String,
      step1: fields[5] as String,
      step2: fields[6] as String,
      step3: fields[7] as String,
      step4: fields[8] as String,
      step5: fields[9] as String,
      mobile: fields[10] as String,
      firstname: fields[11] as String,
      middlename: fields[12] as String,
      lastname: fields[13] as String,
      button: fields[14] as String,
      fromDate: fields[15] as String,
      toDate: fields[16] as String,
      minAmt: fields[17] as String,
      maxAmt: fields[18] as String,
      stepsIf: fields[19] as String,
      stepsIs: fields[20] as String,
      then: fields[21] as String,
      amount: fields[22] as String,
      back: fields[23] as String,
      condition: fields[24] as String,
      type: fields[25] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Steps obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.reg)
      ..writeByte(1)
      ..write(obj.kyc)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.consent)
      ..writeByte(4)
      ..write(obj.deposit)
      ..writeByte(5)
      ..write(obj.step1)
      ..writeByte(6)
      ..write(obj.step2)
      ..writeByte(7)
      ..write(obj.step3)
      ..writeByte(8)
      ..write(obj.step4)
      ..writeByte(9)
      ..write(obj.step5)
      ..writeByte(10)
      ..write(obj.mobile)
      ..writeByte(11)
      ..write(obj.firstname)
      ..writeByte(12)
      ..write(obj.middlename)
      ..writeByte(13)
      ..write(obj.lastname)
      ..writeByte(14)
      ..write(obj.button)
      ..writeByte(15)
      ..write(obj.fromDate)
      ..writeByte(16)
      ..write(obj.toDate)
      ..writeByte(17)
      ..write(obj.minAmt)
      ..writeByte(18)
      ..write(obj.maxAmt)
      ..writeByte(19)
      ..write(obj.stepsIf)
      ..writeByte(20)
      ..write(obj.stepsIs)
      ..writeByte(21)
      ..write(obj.then)
      ..writeByte(22)
      ..write(obj.amount)
      ..writeByte(23)
      ..write(obj.back)
      ..writeByte(24)
      ..write(obj.condition)
      ..writeByte(25)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
