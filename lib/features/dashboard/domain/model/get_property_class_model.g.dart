// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_property_class_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetPropertyClassModelAdapter extends TypeAdapter<GetPropertyClassModel> {
  @override
  final int typeId = 24;

  @override
  GetPropertyClassModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetPropertyClassModel(
      name: fields[0] as String?,
      id: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetPropertyClassModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetPropertyClassModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}