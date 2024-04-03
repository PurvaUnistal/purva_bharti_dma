// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_area_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetAllAreaModelAdapter extends TypeAdapter<GetAllAreaModel> {
  @override
  final int typeId = 2;

  @override
  GetAllAreaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetAllAreaModel(
      gid: fields[0] as String?,
      objectid: fields[1] as dynamic,
      areaName: fields[2] as String?,
      shapeLeng: fields[3] as dynamic,
      areacode: fields[4] as String?,
      cityId: fields[5] as dynamic,
      chargeAreaId: fields[6] as String?,
      subareacod: fields[7] as dynamic,
      shapeLe1: fields[8] as dynamic,
      shapeArea: fields[9] as dynamic,
      readyForConnection: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetAllAreaModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.gid)
      ..writeByte(1)
      ..write(obj.objectid)
      ..writeByte(2)
      ..write(obj.areaName)
      ..writeByte(3)
      ..write(obj.shapeLeng)
      ..writeByte(4)
      ..write(obj.areacode)
      ..writeByte(5)
      ..write(obj.cityId)
      ..writeByte(6)
      ..write(obj.chargeAreaId)
      ..writeByte(7)
      ..write(obj.subareacod)
      ..writeByte(8)
      ..write(obj.shapeLe1)
      ..writeByte(9)
      ..write(obj.shapeArea)
      ..writeByte(10)
      ..write(obj.readyForConnection);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetAllAreaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
