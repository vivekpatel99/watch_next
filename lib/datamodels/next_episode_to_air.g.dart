// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_episode_to_air.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NextEpisodeToAirAdapter extends TypeAdapter<NextEpisodeToAir> {
  @override
  final int typeId = 3;

  @override
  NextEpisodeToAir read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NextEpisodeToAir(
      id: fields[0] as int,
      name: fields[1] as String,
      overview: fields[2] as String,
      voteAverage: fields[3] as double?,
      voteCount: fields[4] as int?,
      airDate: fields[5] as String?,
      episodeNumber: fields[6] as int,
      episodeType: fields[7] as String?,
      productionCode: fields[8] as String?,
      runtime: fields[9] as dynamic,
      seasonNumber: fields[10] as int,
      showId: fields[11] as int,
      stillPath: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NextEpisodeToAir obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.voteCount)
      ..writeByte(5)
      ..write(obj.airDate)
      ..writeByte(6)
      ..write(obj.episodeNumber)
      ..writeByte(7)
      ..write(obj.episodeType)
      ..writeByte(8)
      ..write(obj.productionCode)
      ..writeByte(9)
      ..write(obj.runtime)
      ..writeByte(10)
      ..write(obj.seasonNumber)
      ..writeByte(11)
      ..write(obj.showId)
      ..writeByte(12)
      ..write(obj.stillPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NextEpisodeToAirAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
