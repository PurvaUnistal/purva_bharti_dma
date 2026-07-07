// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_property_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PropertyTypeModelAdapter extends TypeAdapter<PropertyTypeModel> {
  @override
  final int typeId = 33;

  @override
  PropertyTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PropertyTypeModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      propertyCategoryId: fields[2] as String?,
      status: fields[3] as String?,
      createdBy: fields[4] as String?,
      updatedBy: fields[5] as String?,
      createdAt: fields[6] as String?,
      updatedAt: fields[7] as String?,
      code: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PropertyTypeModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.propertyCategoryId)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.createdBy)
      ..writeByte(5)
      ..write(obj.updatedBy)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertyTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
