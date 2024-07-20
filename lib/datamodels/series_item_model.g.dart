// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesItemModelAdapter extends TypeAdapter<TvSeriesItemModel> {
  @override
  final int typeId = 0;

  @override
  TvSeriesItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeriesItemModel(
      adult: fields[0] as bool?,
      backdropPath: fields[1] as String?,
      createdBy: (fields[2] as List?)?.cast<CreatedBy>(),
      episodeRunTime: (fields[3] as List?)?.cast<int>(),
      firstAirDate: fields[4] as DateTime?,
      genres: (fields[5] as List?)?.cast<Genre>(),
      homepage: fields[6] as String?,
      id: fields[7] as int,
      inProduction: fields[8] as bool?,
      languages: (fields[9] as List?)?.cast<String>(),
      lastAirDate: fields[10] as DateTime?,
      name: fields[11] as String,
      nextEpisodeToAir: fields[12] as NextEpisodeToAir?,
      networks: (fields[13] as List?)?.cast<Network>(),
      numberOfEpisodes: fields[14] as int?,
      numberOfSeasons: fields[15] as int?,
      originCountry: (fields[16] as List?)?.cast<String>(),
      originalLanguage: fields[17] as String?,
      overview: fields[18] as String?,
      posterPath: fields[19] as String?,
      seasons: (fields[20] as List?)?.cast<Season>(),
      status: fields[21] as String?,
      tagline: fields[22] as String?,
      voteAverage: fields[23] as double?,
      voteCount: fields[24] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TvSeriesItemModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.createdBy)
      ..writeByte(3)
      ..write(obj.episodeRunTime)
      ..writeByte(4)
      ..write(obj.firstAirDate)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(6)
      ..write(obj.homepage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.inProduction)
      ..writeByte(9)
      ..write(obj.languages)
      ..writeByte(10)
      ..write(obj.lastAirDate)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.nextEpisodeToAir)
      ..writeByte(13)
      ..write(obj.networks)
      ..writeByte(14)
      ..write(obj.numberOfEpisodes)
      ..writeByte(15)
      ..write(obj.numberOfSeasons)
      ..writeByte(16)
      ..write(obj.originCountry)
      ..writeByte(17)
      ..write(obj.originalLanguage)
      ..writeByte(18)
      ..write(obj.overview)
      ..writeByte(19)
      ..write(obj.posterPath)
      ..writeByte(20)
      ..write(obj.seasons)
      ..writeByte(21)
      ..write(obj.status)
      ..writeByte(22)
      ..write(obj.tagline)
      ..writeByte(23)
      ..write(obj.voteAverage)
      ..writeByte(24)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSeriesItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
