// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_search_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesSearchResultAdapter extends TypeAdapter<TvSeriesSearchResult> {
  @override
  final int typeId = 1;

  @override
  TvSeriesSearchResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeriesSearchResult(
      isChecked: fields[13] as bool,
      adult: fields[0] as bool,
      backdropPath: fields[1] as String?,
      genreIds: (fields[2] as List).cast<int>(),
      id: fields[3] as int,
      originCountry: (fields[4] as List).cast<String>(),
      originalLanguage: fields[5] as String,
      originalName: fields[6] as String,
      overview: fields[7] as String,
      posterPath: fields[8] as String?,
      firstAirDate: fields[9] as String,
      name: fields[10] as String,
      voteAverage: fields[11] as double?,
      voteCount: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TvSeriesSearchResult obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originCountry)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalName)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.firstAirDate)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.voteAverage)
      ..writeByte(12)
      ..write(obj.voteCount)
      ..writeByte(13)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSeriesSearchResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
