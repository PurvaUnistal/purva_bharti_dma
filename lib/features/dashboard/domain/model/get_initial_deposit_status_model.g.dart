// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_initial_deposit_status_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetInitialDepositStatusModelAdapter
    extends TypeAdapter<GetInitialDepositStatusModel> {
  @override
  final int typeId = 10;

  @override
  GetInitialDepositStatusModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetInitialDepositStatusModel(
      s0: fields[0] as String?,
      s1: fields[1] as String?,
      s2: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetInitialDepositStatusModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.s0)
      ..writeByte(1)
      ..write(obj.s1)
      ..writeByte(2)
      ..write(obj.s2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetInitialDepositStatusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
