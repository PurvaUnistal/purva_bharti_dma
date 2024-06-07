// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_deposit_offline_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetAllDepositOfflineModelAdapter
    extends TypeAdapter<GetAllDepositOfflineModel> {
  @override
  final int typeId = 3;

  @override
  GetAllDepositOfflineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetAllDepositOfflineModel(
      depositTypesId: fields[0] as String?,
      depositName: fields[1] as String?,
      depositFree: fields[2] as int?,
      rentAmount: fields[3] as String?,
      depositAmount: fields[4] as String?,
      status: fields[5] as String?,
      schemeMonth: fields[6] as int?,
      schemeType: fields[7] as String?,
      dateFrom: fields[8] as DateTime?,
      dateTo: fields[9] as dynamic,
      depositAmountBeforeNgc: fields[10] as int?,
      schemeCode: fields[11] as String?,
      gasDepositAmount: fields[12] as int?,
      equipmentDepositAmount: fields[13] as int?,
      interestAmount: fields[14] as String?,
      createdAt: fields[15] as dynamic,
      updatedAt: fields[16] as dynamic,
      rejectComments: fields[17] as dynamic,
      customerCount: fields[18] as String?,
      registrationGst: fields[19] as String?,
      interestTax: fields[20] as dynamic,
      rebateId: fields[21] as String?,
      totalAmount: fields[22] as String?,
      firstDepositAmount: fields[23] as String?,
      nextCycleAmount: fields[24] as String?,
      totalAmountWith: fields[25] as String?,
      firstDepositAmountWith: fields[26] as int?,
      depositAmountExcludingTaxWith: fields[27] as String?,
      registrationGstWith: fields[28] as String?,
      depositAmountWith: fields[29] as String?,
      benifitApplicable: fields[30] as String?,
      equipmentIncludeInBill: fields[31] as String?,
      registrationRefunded: fields[32] as String?,
      equipmentRefunded: fields[33] as String?,
      gasRefunded: fields[34] as String?,
      approvalStatus: fields[35] as String?,
      approvalDate: fields[36] as DateTime?,
      depositTaxPer: fields[37] as String?,
      interestTaxPer: fields[38] as dynamic,
      registrationTaxName: fields[39] as String?,
      interestTaxName: fields[40] as dynamic,
      remainingCount: fields[41] as int?,
      propertyCategoryId: fields[42] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetAllDepositOfflineModel obj) {
    writer
      ..writeByte(43)
      ..writeByte(0)
      ..write(obj.depositTypesId)
      ..writeByte(1)
      ..write(obj.depositName)
      ..writeByte(2)
      ..write(obj.depositFree)
      ..writeByte(3)
      ..write(obj.rentAmount)
      ..writeByte(4)
      ..write(obj.depositAmount)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.schemeMonth)
      ..writeByte(7)
      ..write(obj.schemeType)
      ..writeByte(8)
      ..write(obj.dateFrom)
      ..writeByte(9)
      ..write(obj.dateTo)
      ..writeByte(10)
      ..write(obj.depositAmountBeforeNgc)
      ..writeByte(11)
      ..write(obj.schemeCode)
      ..writeByte(12)
      ..write(obj.gasDepositAmount)
      ..writeByte(13)
      ..write(obj.equipmentDepositAmount)
      ..writeByte(14)
      ..write(obj.interestAmount)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.rejectComments)
      ..writeByte(18)
      ..write(obj.customerCount)
      ..writeByte(19)
      ..write(obj.registrationGst)
      ..writeByte(20)
      ..write(obj.interestTax)
      ..writeByte(21)
      ..write(obj.rebateId)
      ..writeByte(22)
      ..write(obj.totalAmount)
      ..writeByte(23)
      ..write(obj.firstDepositAmount)
      ..writeByte(24)
      ..write(obj.nextCycleAmount)
      ..writeByte(25)
      ..write(obj.totalAmountWith)
      ..writeByte(26)
      ..write(obj.firstDepositAmountWith)
      ..writeByte(27)
      ..write(obj.depositAmountExcludingTaxWith)
      ..writeByte(28)
      ..write(obj.registrationGstWith)
      ..writeByte(29)
      ..write(obj.depositAmountWith)
      ..writeByte(30)
      ..write(obj.benifitApplicable)
      ..writeByte(31)
      ..write(obj.equipmentIncludeInBill)
      ..writeByte(32)
      ..write(obj.registrationRefunded)
      ..writeByte(33)
      ..write(obj.equipmentRefunded)
      ..writeByte(34)
      ..write(obj.gasRefunded)
      ..writeByte(35)
      ..write(obj.approvalStatus)
      ..writeByte(36)
      ..write(obj.approvalDate)
      ..writeByte(37)
      ..write(obj.depositTaxPer)
      ..writeByte(38)
      ..write(obj.interestTaxPer)
      ..writeByte(39)
      ..write(obj.registrationTaxName)
      ..writeByte(40)
      ..write(obj.interestTaxName)
      ..writeByte(41)
      ..write(obj.remainingCount)
      ..writeByte(42)
      ..write(obj.propertyCategoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetAllDepositOfflineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
