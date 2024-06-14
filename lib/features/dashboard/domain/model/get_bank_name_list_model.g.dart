// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_bank_name_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankNameListModelAdapter extends TypeAdapter<BankNameListModel> {
  @override
  final int typeId = 30;

  @override
  BankNameListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankNameListModel(
      key: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BankNameListModel obj) {
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
      other is BankNameListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
