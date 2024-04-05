// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_kyc_doc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetKycDocModelAdapter extends TypeAdapter<GetKycDocModel> {
  @override
  final int typeId = 11;

  @override
  GetKycDocModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetKycDocModel(
      s1: fields[0] as String?,
      s2: fields[1] as String?,
      s3: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetKycDocModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.s1)
      ..writeByte(1)
      ..write(obj.s2)
      ..writeByte(2)
      ..write(obj.s3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetKycDocModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
