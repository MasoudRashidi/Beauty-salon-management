// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerModelAdapter extends TypeAdapter<CustomerModel> {
  @override
  final int typeId = 1;

  @override
  CustomerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerModel(
      name: fields[0] as String,
      lastName: fields[1] as String,
      dateOfBirth: fields[2] as String,
      tel: fields[3] as String,
      mail: fields[4] as String,
      address: fields[5] as String,
      note: fields[6] as String,
      factors: (fields[7] as List)?.cast<FactorModel>(),
      point: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.dateOfBirth)
      ..writeByte(3)
      ..write(obj.tel)
      ..writeByte(4)
      ..write(obj.mail)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.factors)
      ..writeByte(8)
      ..write(obj.point);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
