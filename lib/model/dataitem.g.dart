// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataitem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataitemAdapter extends TypeAdapter<Dataitem> {
  @override
  final int typeId = 2;

  @override
  Dataitem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dataitem(
      item_name: fields[0] as String,
      price: fields[1] as double,
      qty: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Dataitem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.item_name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataitemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
