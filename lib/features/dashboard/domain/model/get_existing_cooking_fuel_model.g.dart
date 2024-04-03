// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_existing_cooking_fuel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetExistingCookingFuelModelAdapter
    extends TypeAdapter<GetExistingCookingFuelModel> {
  @override
  final int typeId = 7;

  @override
  GetExistingCookingFuelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetExistingCookingFuelModel(
      gasCylinder: fields[0] as String?,
      electric: fields[1] as String?,
      kerosene: fields[2] as String?,
      coal: fields[3] as String?,
      wood: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetExistingCookingFuelModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.gasCylinder)
      ..writeByte(1)
      ..write(obj.electric)
      ..writeByte(2)
      ..write(obj.kerosene)
      ..writeByte(3)
      ..write(obj.coal)
      ..writeByte(5)
      ..write(obj.wood);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetExistingCookingFuelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
