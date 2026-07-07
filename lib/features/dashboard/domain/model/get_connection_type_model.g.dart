// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_connection_type_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConnectionTypeModelAdapter extends TypeAdapter<ConnectionTypeModel> {
  @override
  final int typeId = 32;

  @override
  ConnectionTypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConnectionTypeModel(
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConnectionTypeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectionTypeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
