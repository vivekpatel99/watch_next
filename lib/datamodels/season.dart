// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'season.g.dart';

@HiveType(typeId: 6) // Adjust typeId if needed
class Season extends HiveObject {
  @HiveField(0)
  final String? airDate;

  @HiveField(1)
  final int? episodeCount;

  @HiveField(2)
  final int id;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String? overview;

  @HiveField(5)
  final String? posterPath;

  @HiveField(6)
  final int? seasonNumber;

  @HiveField(7)
  final double? voteAverage;

  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        airDate: json['air_date'] as String?,
        episodeCount: json['episode_count'] as int?,
        id: json['id'] as int,
        name: json['name'] as String,
        overview: json['overview'] as String?,
        posterPath: json['poster_path'] as String?,
        seasonNumber: json['season_number'] as int?,
        voteAverage: json['vote_average'] as double?,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'airDate': airDate,
      'episodeCount': episodeCount,
      'id': id,
      'name': name,
      'overview': overview,
      'posterPath': posterPath,
      'seasonNumber': seasonNumber,
      'voteAverage': voteAverage,
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      airDate: map['airDate'] as String,
      episodeCount: map['episodeCount'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      overview: map['overview'] as String,
      posterPath: map['posterPath'] as String,
      seasonNumber: map['seasonNumber'] as int,
      voteAverage: map['voteAverage'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Season.fromJson(String source) => Season.fromMap(json.decode(source) as Map<String, dynamic>);
}
