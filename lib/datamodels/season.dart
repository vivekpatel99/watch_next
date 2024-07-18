// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Season {
  final String? airDate;
  final int? episodeCount;
  final int id;
  final String name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
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
