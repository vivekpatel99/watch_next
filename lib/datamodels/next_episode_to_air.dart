// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'next_episode_to_air.g.dart';

@HiveType(typeId: 3) // Adjust typeId if needed
class NextEpisodeToAir extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final double? voteAverage;

  @HiveField(4)
  final int? voteCount;

  @HiveField(5)
  final String? airDate;

  @HiveField(6)
  final int episodeNumber;

  @HiveField(7)
  final String? episodeType;

  @HiveField(8)
  final String? productionCode;

  // Use HiveField.json for dynamic data
  @HiveField(9)
  final dynamic runtime;

  @HiveField(10)
  final int seasonNumber;

  @HiveField(11)
  final int showId;

  @HiveField(12)
  final String? stillPath;

  NextEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    this.stillPath,
  });

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      NextEpisodeToAir(
        id: json['id'] as int,
        name: json['name'] as String,
        overview: json['overview'] as String,
        voteAverage: json['vote_average'] as double,
        voteCount: json['vote_count'] as int,
        airDate: json['air_date'] as String,
        episodeNumber: json['episode_number'] as int,
        episodeType: json['episode_type'] as String,
        productionCode: json['production_code'] as String,
        runtime: json['runtime'],
        seasonNumber: json['season_number'] as int,
        showId: json['show_id'] as int,
        stillPath: json['still_path'] as String?,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'overview': overview,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'airDate': airDate,
      'episodeNumber': episodeNumber,
      'episodeType': episodeType,
      'productionCode': productionCode,
      'runtime': runtime,
      'seasonNumber': seasonNumber,
      'showId': showId,
      'stillPath': stillPath,
    };
  }

  factory NextEpisodeToAir.fromMap(Map<String, dynamic> map) {
    return NextEpisodeToAir(
      id: map['id'] as int,
      name: map['name'] as String,
      overview: map['overview'] as String,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
      airDate: map['airDate'] as String,
      episodeNumber: map['episodeNumber'] as int,
      episodeType: map['episodeType'] as String,
      productionCode: map['productionCode'] as String,
      runtime: map['runtime'] as dynamic,
      seasonNumber: map['seasonNumber'] as int,
      showId: map['showId'] as int,
      stillPath: map['stillPath'] != null ? map['stillPath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  // factory NextEpisodeToAir.fromJson(String source) => NextEpisodeToAir.fromMap(json.decode(source) as Map<String, dynamic>);
}
