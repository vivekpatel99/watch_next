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
}
