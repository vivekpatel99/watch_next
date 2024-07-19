// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NetworkAdapter extends TypeAdapter<Network> {
  @override
  final int typeId = 2;

  @override
  Network read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Network(
      id: fields[0] as int,
      logoPath: fields[1] as String?,
      name: fields[2] as String,
      originCountry: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Network obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.logoPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.originCountry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
