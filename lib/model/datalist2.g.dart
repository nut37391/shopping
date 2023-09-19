// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datalist2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Datalist2Adapter extends TypeAdapter<Datalist2> {
  @override
  final int typeId = 1;

  @override
  Datalist2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datalist2(
      items: (fields[2] as List).cast<Datalist>(),
    );
  }

  @override
  void write(BinaryWriter writer, Datalist2 obj) {
    writer
      ..writeByte(1)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Datalist2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
