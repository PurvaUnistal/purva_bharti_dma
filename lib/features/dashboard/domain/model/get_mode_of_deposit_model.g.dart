// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_mode_of_deposit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetModeOfDepositModelAdapter extends TypeAdapter<GetModeOfDepositModel> {
  @override
  final int typeId = 20;

  @override
  GetModeOfDepositModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetModeOfDepositModel(
      s1: fields[0] as String?,
      s2: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetModeOfDepositModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.s1)
      ..writeByte(1)
      ..write(obj.s2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetModeOfDepositModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
