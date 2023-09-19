// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datalist_m.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatalistAdapter extends TypeAdapter<Datalist> {
  @override
  final int typeId = 0;

  @override
  Datalist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datalist(
      name: fields[0] as String,
      datetime: fields[1] as DateTime,
      items: (fields[2] as List).cast<Dataitem>(),
      total: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Datalist obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.datetime)
      ..writeByte(2)
      ..write(obj.items)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatalistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
