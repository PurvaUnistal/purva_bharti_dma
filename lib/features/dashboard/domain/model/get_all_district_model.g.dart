// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_district_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetAllDistrictModelAdapter extends TypeAdapter<GetAllDistrictModel> {
  @override
  final int typeId = 4;

  @override
  GetAllDistrictModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetAllDistrictModel(
      id: fields[0] as String?,
      districtName: fields[1] as String?,
      status: fields[2] as String?,
      createdAt: fields[3] as DateTime?,
      updatedAt: fields[4] as dynamic,
      approvalStatus: fields[5] as String?,
      approvalDate: fields[6] as dynamic,
      remarks: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, GetAllDistrictModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.districtName)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.approvalStatus)
      ..writeByte(6)
      ..write(obj.approvalDate)
      ..writeByte(7)
      ..write(obj.remarks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetAllDistrictModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
