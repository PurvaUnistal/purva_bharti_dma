// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_charge_area_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetChargeAreaListModelAdapter
    extends TypeAdapter<GetChargeAreaListModel> {
  @override
  final int typeId = 5;

  @override
  GetChargeAreaListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetChargeAreaListModel(
      gid: fields[0] as String?,
      chargeAreaCode: fields[1] as String?,
      projectId: fields[2] as String?,
      objectid: fields[3] as dynamic,
      shapeLeng: fields[4] as dynamic,
      shapeArea: fields[5] as dynamic,
      chargeAreaName: fields[6] as String?,
      billingType: fields[7] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, GetChargeAreaListModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.gid)
      ..writeByte(1)
      ..write(obj.chargeAreaCode)
      ..writeByte(2)
      ..write(obj.projectId)
      ..writeByte(3)
      ..write(obj.objectid)
      ..writeByte(4)
      ..write(obj.shapeLeng)
      ..writeByte(5)
      ..write(obj.shapeArea)
      ..writeByte(6)
      ..write(obj.chargeAreaName)
      ..writeByte(7)
      ..write(obj.billingType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetChargeAreaListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
