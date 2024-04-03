// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_guardian_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetGuardianTypeModelAdapter extends TypeAdapter<GetGuardianTypeModel> {
  @override
  final int typeId = 8;

  @override
  GetGuardianTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetGuardianTypeModel(
      father: fields[0] as String?,
      spouse: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetGuardianTypeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.father)
      ..writeByte(1)
      ..write(obj.spouse);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetGuardianTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
