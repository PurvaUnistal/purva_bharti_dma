// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_accept_extra_fitting_cost_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetAcceptExtraFittingCostModelAdapter
    extends TypeAdapter<GetAcceptExtraFittingCostModel> {
  @override
  final int typeId = 1;

  @override
  GetAcceptExtraFittingCostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetAcceptExtraFittingCostModel(
      key: fields[0] as String?,
      value: fields[1] as String?,
    )..s3 = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, GetAcceptExtraFittingCostModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.s3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetAcceptExtraFittingCostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
