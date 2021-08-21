// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactorModelAdapter extends TypeAdapter<FactorModel> {
  @override
  final int typeId = 2;

  @override
  FactorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactorModel(
      date: fields[0] as DateTime,
      sum: fields[1] as double,
      services: (fields[2] as List)?.cast<ServiceModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, FactorModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.sum)
      ..writeByte(2)
      ..write(obj.services);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
