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
      key: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetKycDocModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.value);
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
