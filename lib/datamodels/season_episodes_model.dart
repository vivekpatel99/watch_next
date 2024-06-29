// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Season {
  final String airDate;
  final List<Episode> episodes;

  Season({
    required this.airDate,
    required this.episodes,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        airDate: json['air_date'] as String,
        episodes: (json['episodes'] as List<dynamic>)
            .map((dynamic item) =>
                Episode.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'airDate': airDate,
      'episodes': episodes.map((x) => x.toMap()).toList(),
    };
  }

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      airDate: map['airDate'] as String,
      episodes: List<Episode>.from(
        (map['episodes'] as List<int>).map<Episode>(
          (x) => Episode.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  // factory Season.fromJson(String source) => Season.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Episode {
  final String airDate;
  final int episodeNumber;
  final String episodeType;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int runtime;
  final int seasonNumber;
  final int showId;
  final String stillPath;
  final double voteAverage;
  final int voteCount;

  Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        airDate: json['air_date'] as String,
        episodeNumber: json['episode_number'] as int,
        episodeType: json['episode_type'] as String,
        id: json['id'] as int,
        name: json['name'] as String,
        overview: json['overview'] as String,
        productionCode: json['production_code'] as String,
        runtime: json['runtime'] as int,
        seasonNumber: json['season_number'] as int,
        showId: json['show_id'] as int,
        stillPath: json['still_path'] as String,
        voteAverage: json['vote_average'] as double,
        voteCount: json['vote_count'] as int,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'airDate': airDate,
      'episodeNumber': episodeNumber,
      'episodeType': episodeType,
      'id': id,
      'name': name,
      'overview': overview,
      'productionCode': productionCode,
      'runtime': runtime,
      'seasonNumber': seasonNumber,
      'showId': showId,
      'stillPath': stillPath,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      airDate: map['airDate'] as String,
      episodeNumber: map['episodeNumber'] as int,
      episodeType: map['episodeType'] as String,
      id: map['id'] as int,
      name: map['name'] as String,
      overview: map['overview'] as String,
      productionCode: map['productionCode'] as String,
      runtime: map['runtime'] as int,
      seasonNumber: map['seasonNumber'] as int,
      showId: map['showId'] as int,
      stillPath: map['stillPath'] as String,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  // factory Episode.fromJson(String source) =>
  //     Episode.fromMap(json.decode(source) as Map<String, dynamic>);
}
