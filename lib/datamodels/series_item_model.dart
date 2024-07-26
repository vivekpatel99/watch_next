// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/created_by.dart';
import 'package:watch_next/datamodels/genre.dart';
import 'package:watch_next/datamodels/network.dart';
import 'package:watch_next/datamodels/next_episode_to_air.dart';
import 'package:watch_next/datamodels/season.dart';

part 'series_item_model.g.dart';

@HiveType(typeId: 0)
class TvSeriesItemModel extends HiveObject {
  @HiveField(0)
  final bool? adult;

  @HiveField(1)
  final String? backdropPath;

  @HiveField(2)
  final List<CreatedBy>? createdBy;

  @HiveField(3)
  final List<int>? episodeRunTime;

  @HiveField(4)
  final DateTime? firstAirDate;

  @HiveField(5)
  final List<Genre>? genres;

  @HiveField(6)
  final String? homepage;

  @HiveField(7)
  final int id;

  @HiveField(8)
  final bool? inProduction;

  @HiveField(9)
  final List<String>? languages;

  @HiveField(10)
  final DateTime? lastAirDate;

  @HiveField(11)
  final String name;

  @HiveField(12)
  final NextEpisodeToAir? nextEpisodeToAir;

  @HiveField(13)
  final List<Network>? networks;

  @HiveField(14)
  final int? numberOfEpisodes;

  @HiveField(15)
  final int? numberOfSeasons;

  @HiveField(16)
  final List<String>? originCountry;

  @HiveField(17)
  final String? originalLanguage;

  @HiveField(18)
  final String? overview;

  @HiveField(19)
  final String? posterPath;

  @HiveField(20)
  final List<Season>? seasons;

  @HiveField(21)
  final String? status;

  @HiveField(22)
  final String? tagline;

  @HiveField(23)
  final double? voteAverage;

  @HiveField(24)
  final int? voteCount;

  TvSeriesItemModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.overview,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvSeriesItemModel.fromJson(Map<String, dynamic> json) {
    // Add debugging statements to check the incoming JSON

    // print('Parsing JSON: $json');

    return TvSeriesItemModel(
      adult: json['adult'] as bool?,
      backdropPath:
          json['backdrop_path'] != null ? json['backdrop_path'] as String : "",
      createdBy: json['created_by'] != null
          ? (json['created_by'] as List<dynamic>)
              .map((item) => CreatedBy.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      episodeRunTime: json['episode_run_time'] != null
          ? (json['episode_run_time'] as List<dynamic>).cast<int>()
          : null,
      firstAirDate: json['first_air_date'] != null
          ? DateFormat('yyyy-MM-dd').parse(json['first_air_date'] as String)
          : null,
      genres: json['genres'] != null
          ? (json['genres'] as List<dynamic>)
              .map((item) => Genre.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      homepage: json['homepage'] != null ? json['homepage'] as String : null,
      id: json['id'] as int,
      inProduction: json['in_production'] as bool?,
      languages: json['languages'] != null
          ? (json['languages'] as List<dynamic>).cast<String>()
          : null,
      lastAirDate: json['last_air_date'] != null
          ? DateFormat('yyyy-MM-dd').parse(json['last_air_date'] as String)
          : null,
      name: json['name'] as String,
      nextEpisodeToAir: json['next_episode_to_air'] != null
          ? NextEpisodeToAir.fromJson(
              json['next_episode_to_air'] as Map<String, dynamic>)
          : null,
      networks: json['networks'] != null
          ? (json['networks'] as List<dynamic>)
              .map((item) => Network.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      numberOfEpisodes: json['number_of_episodes'] as int?,
      numberOfSeasons: json['number_of_seasons'] as int?,
      originCountry: json['origin_country'] != null
          ? (json['origin_country'] as List<dynamic>).cast<String>()
          : null,
      originalLanguage: json['original_language'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] != null
          ? ApiConstants.apiImageEndpoint + (json['poster_path'] as String)
          : null,
      seasons: json['seasons'] != null
          ? (json['seasons'] as List<dynamic>)
              .map((item) => Season.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'createdBy':
          (createdBy != null) ? createdBy!.map((x) => x.toMap()).toList() : [],
      'episodeRunTime': episodeRunTime,
      'firstAirDate': firstAirDate,
      'genres': (genres != null) ? genres!.map((x) => x.toMap()).toList() : [],
      'homepage': homepage,
      'id': id,
      'inProduction': inProduction,
      'languages': languages,
      'lastAirDate': lastAirDate,
      'name': name,
      'nextEpisodeToAir':
          (nextEpisodeToAir != null) ? nextEpisodeToAir!.toMap() : null,
      'networks':
          (networks != null) ? networks!.map((x) => x.toMap()).toList() : null,
      'numberOfEpisodes': numberOfEpisodes,
      'numberOfSeasons': numberOfSeasons,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'overview': overview,
      'posterPath': posterPath,
      'seasons':
          (seasons != null) ? seasons!.map((x) => x.toMap()).toList() : null,
      'status': status,
      'tagline': tagline,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory TvSeriesItemModel.fromMap(Map<String, dynamic> map) {
    return TvSeriesItemModel(
      adult: map['adult'] as bool,
      backdropPath: map['backdropPath'] as String,
      createdBy: List<CreatedBy>.from((map['createdBy'] as List<int>)
          .map<CreatedBy>((x) => CreatedBy.fromMap(x as Map<String, dynamic>))),
      episodeRunTime: List<int>.from((map['episodeRunTime'] as List<int>)),
      firstAirDate: map['firstAirDate'] as DateTime,
      genres: List<Genre>.from(
        (map['genres'] as List<int>).map<Genre>(
          (x) => Genre.fromMap(x as Map<String, dynamic>),
        ),
      ),
      homepage: map['homepage'] as String,
      id: map['id'] as int,
      inProduction: map['inProduction'] as bool,
      languages: List<String>.from((map['languages'] as List<String>)),
      lastAirDate: map['lastAirDate'] as DateTime,
      name: map['name'] as String,
      nextEpisodeToAir: NextEpisodeToAir.fromMap(
          map['nextEpisodeToAir'] as Map<String, dynamic>),
      networks: List<Network>.from(
        (map['networks'] as List<int>).map<Network>(
          (x) => Network.fromMap(x as Map<String, dynamic>),
        ),
      ),
      numberOfEpisodes: map['numberOfEpisodes'] as int,
      numberOfSeasons: map['numberOfSeasons'] as int,
      originCountry: List<String>.from((map['originCountry'] as List<String>)),
      originalLanguage: map['originalLanguage'] as String,
      overview: map['overview'] as String,
      posterPath: map['posterPath'] as String,
      seasons: List<Season>.from(
        (map['seasons'] as List<int>).map<Season>(
          (x) => Season.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] as String,
      tagline: map['tagline'] as String,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  // factory TvSeriesItemModel.fromJson(String source) => TvSeriesItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
