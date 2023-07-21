// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optioin_item_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionItemClassAdapter extends TypeAdapter<OptionItemClass> {
  @override
  final int typeId = 2;

  @override
  OptionItemClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionItemClass(
      fields[1] as OptionItem,
    );
  }

  @override
  void write(BinaryWriter writer, OptionItemClass obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.optionItem);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionItemClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
