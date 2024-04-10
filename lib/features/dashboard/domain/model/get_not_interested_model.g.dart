// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_not_interested_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetNotInterestedModelAdapter extends TypeAdapter<GetNotInterestedModel> {
  @override
  final int typeId = 21;

  @override
  GetNotInterestedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetNotInterestedModel(
      key: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetNotInterestedModel obj) {
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
      other is GetNotInterestedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
