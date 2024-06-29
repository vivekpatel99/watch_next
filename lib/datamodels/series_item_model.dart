// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:watch_next/datamodels/created_by.dart';
import 'package:watch_next/datamodels/genre.dart';
import 'package:watch_next/datamodels/network.dart';
import 'package:watch_next/datamodels/next_episode_to_air.dart';
import 'package:watch_next/datamodels/season.dart';

class TvSeriesItemModel {
  final bool adult;
  final String backdropPath;
  final List<CreatedBy> createdBy;
  final List<int> episodeRunTime;
  final String firstAirDate;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final bool inProduction;
  final List<String> languages;
  final String lastAirDate;
  final String name;
  final NextEpisodeToAir nextEpisodeToAir;
  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<String> originCountry;
  final String originalLanguage;
  final String overview;
  final String posterPath;
  final List<Season> seasons;
  final String status;
  final String tagline;
  final double voteAverage;
  final int voteCount;

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

  factory TvSeriesItemModel.fromJson(Map<String, dynamic> json) =>
      TvSeriesItemModel(
        adult: json['adult'] as bool,
        backdropPath: json['backdrop_path'] as String,
        createdBy: (json['created_by'] as List<dynamic>)
            .map((dynamic item) =>
                CreatedBy.fromJson(item as Map<String, dynamic>))
            .toList(),
        episodeRunTime: (json['episode_run_time'] as List<dynamic>).cast<int>(),
        firstAirDate: json['first_air_date'] as String,
        genres: (json['genres'] as List<Genre>)
            .map((dynamic item) => Genre.fromJson(item as Map<String, dynamic>))
            .toList(),
        homepage: json['homepage'] as String,
        id: json['id'] as int,
        inProduction: json['in_production'] as bool,
        languages: (json['languages'] as List<dynamic>).cast<String>(),
        lastAirDate: json['last_air_date'] as String,
        name: json['name'] as String,
        nextEpisodeToAir: NextEpisodeToAir.fromJson(
            json['next_episode_to_air'] as Map<String, dynamic>),
        networks: (json['networks'] as List<dynamic>)
            .map((dynamic item) =>
                Network.fromJson(item as Map<String, dynamic>))
            .toList(),
        numberOfEpisodes: json['number_of_episodes'] as int,
        numberOfSeasons: json['number_of_seasons'] as int,
        originCountry: (json['origin_country'] as List<dynamic>).cast<String>(),
        originalLanguage: json['original_language'] as String,
        overview: json['overview'] as String,
        posterPath: json['poster_path'] as String,
        seasons: (json['seasons'] as List<dynamic>)
            .map(
                (dynamic item) => Season.fromJson(item as Map<String, dynamic>))
            .toList(),
        status: json['status'] as String,
        tagline: json['tagline'] as String,
        voteAverage: json['vote_average'] as double,
        voteCount: json['vote_count'] as int,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdropPath': backdropPath,
      'createdBy': createdBy.map((x) => x.toMap()).toList(),
      'episodeRunTime': episodeRunTime,
      'firstAirDate': firstAirDate,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'inProduction': inProduction,
      'languages': languages,
      'lastAirDate': lastAirDate,
      'name': name,
      'nextEpisodeToAir': nextEpisodeToAir.toMap(),
      'networks': networks.map((x) => x.toMap()).toList(),
      'numberOfEpisodes': numberOfEpisodes,
      'numberOfSeasons': numberOfSeasons,
      'originCountry': originCountry,
      'originalLanguage': originalLanguage,
      'overview': overview,
      'posterPath': posterPath,
      'seasons': seasons.map((x) => x.toMap()).toList(),
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
      createdBy: List<CreatedBy>.from(
        (map['createdBy'] as List<int>).map<CreatedBy>(
          (x) => CreatedBy.fromMap(x as Map<String, dynamic>),
        ),
      ),
      episodeRunTime: List<int>.from((map['episodeRunTime'] as List<int>)),
      firstAirDate: map['firstAirDate'] as String,
      genres: List<Genre>.from(
        (map['genres'] as List<int>).map<Genre>(
          (x) => Genre.fromMap(x as Map<String, dynamic>),
        ),
      ),
      homepage: map['homepage'] as String,
      id: map['id'] as int,
      inProduction: map['inProduction'] as bool,
      languages: List<String>.from((map['languages'] as List<String>)),
      lastAirDate: map['lastAirDate'] as String,
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
