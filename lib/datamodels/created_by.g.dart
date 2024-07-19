// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatedByAdapter extends TypeAdapter<CreatedBy> {
  @override
  final int typeId = 5;

  @override
  CreatedBy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatedBy(
      id: fields[0] as int,
      creditId: fields[1] as String,
      name: fields[2] as String,
      originalName: fields[3] as String,
      gender: fields[4] as int,
      profilePath: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreatedBy obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creditId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originalName)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatedByAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
