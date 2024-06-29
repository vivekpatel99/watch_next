// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NextEpisodeToAir {
  final int id;
  final String name;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final String airDate;
  final int episodeNumber;
  final String episodeType;
  final String productionCode;
  final dynamic runtime; // Can be null based on the JSON data
  final int seasonNumber;
  final int showId;
  final String? stillPath; // Optional since stillPath might be null

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
