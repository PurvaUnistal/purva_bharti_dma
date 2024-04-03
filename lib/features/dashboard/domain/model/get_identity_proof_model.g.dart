// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_identity_proof_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetIdentityProofModelAdapter extends TypeAdapter<GetIdentityProofModel> {
  @override
  final int typeId = 9;

  @override
  GetIdentityProofModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetIdentityProofModel(
      s1: fields[0] as String?,
      s2: fields[1] as String?,
      s3: fields[2] as String?,
      s4: fields[3] as String?,
      s5: fields[4] as String?,
      s6: fields[5] as String?,
      s7: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetIdentityProofModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.s1)
      ..writeByte(1)
      ..write(obj.s2)
      ..writeByte(2)
      ..write(obj.s3)
      ..writeByte(3)
      ..write(obj.s4)
      ..writeByte(4)
      ..write(obj.s5)
      ..writeByte(5)
      ..write(obj.s6)
      ..writeByte(6)
      ..write(obj.s7);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetIdentityProofModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
