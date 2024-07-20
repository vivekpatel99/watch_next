import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:watch_next/contants/api_constants.dart';
part 'tv_series_search_response_model.g.dart';

@HiveType(typeId: 1)
class TvSeriesSearchResult {
  @HiveField(0)
  final bool adult;

  @HiveField(1)
  final String? backdropPath;

  @HiveField(2)
  final List<int> genreIds;

  @HiveField(3)
  final int id;

  @HiveField(4)
  final List<String> originCountry;

  @HiveField(5)
  final String originalLanguage;

  @HiveField(6)
  final String originalName;

  @HiveField(7)
  final String overview;

  @HiveField(8)
  final String? posterPath;

  @HiveField(9)
  final DateTime firstAirDate;

  @HiveField(10)
  final String name;

  @HiveField(11)
  final double? voteAverage;

  @HiveField(12)
  final int? voteCount;

  @HiveField(13)
  bool isChecked;

  TvSeriesSearchResult({
    this.isChecked = false,
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvSeriesSearchResult.fromJson(Map<String, dynamic> json) =>
      TvSeriesSearchResult(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] as String?,
        genreIds: (json['genre_ids'] as List<dynamic>).cast<int>(),
        id: json['id'] as int,
        originCountry: (json['origin_country'] as List<dynamic>).cast<String>(),
        originalLanguage: json['original_language'] as String,
        originalName: json['original_name'] as String,
        overview: json['overview'] as String,
        posterPath: (json['poster_path'] as String?) != null
            ? ApiConstants.apiImageEndpoint + (json['poster_path'] as String)
            : null,
        firstAirDate:
            DateFormat('yyyy-MM-dd').parse(json['first_air_date'] as String),
        name: json['name'] as String,
        voteAverage: json['vote_average'] as double?,
        voteCount: json['vote_count'] as int?,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'id': id,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'originalName': originalName,
      'overview': overview,
      'posterPath': posterPath,
      'firstAirDate': firstAirDate,
      'name': name,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory TvSeriesSearchResult.fromMap(Map<String, dynamic> map) {
    return TvSeriesSearchResult(
      adult: map['adult'] as bool,
      backdropPath:
          map['backdropPath'] != null ? map['backdropPath'] as String : null,
      genreIds: List<int>.from((map['genreIds'] as List<int>)),
      id: map['id'] as int,
      originCountry: List<String>.from((map['originCountry'] as List<String>)),
      originalLanguage: map['originalLanguage'] as String,
      originalName: map['originalName'] as String,
      overview: map['overview'] as String,
      posterPath: map['posterPath'] as String,
      firstAirDate:
          DateFormat('yyyy-MM-dd').parse(map['first_air_date'] as String),
      name: map['name'] as String,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
    );
  }
  @override
  String toString() {
    return '$name: $id'; // You can modify this to display other desired information
  }

  String toJson() => json.encode(toMap());
}
