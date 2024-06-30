// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Do not need convert whole  reponse into dataclass, we need only result
// class TvSeriesSearchResponse {
//   final int page;
//   final List<TvSeriesSearchResult> results;
//   final int totalPages;
//   final int totalResults;

//   TvSeriesSearchResponse({
//     required this.page,
//     required this.results,
//     required this.totalPages,
//     required this.totalResults,
//   });

//   factory TvSeriesSearchResponse.fromJson(Map<String, dynamic> json) =>
//       TvSeriesSearchResponse(
//         page: json['page'] as int,
//         results: (json['results'] as List<dynamic>)
//             .map((dynamic item) =>
//                 TvSeriesSearchResult.fromJson(item as Map<String, dynamic>))
//             .toList(),
//         totalPages: json['total_pages'] as int,
//         totalResults: json['total_results'] as int,
//       );

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'page': page,
//       'results': results.map((x) => x.toMap()).toList(),
//       'totalPages': totalPages,
//       'totalResults': totalResults,
//     };
//   }

//   factory TvSeriesSearchResponse.fromMap(Map<String, dynamic> map) {
//     return TvSeriesSearchResponse(
//       page: map['page'] as int,
//       results: List<TvSeriesSearchResult>.from(
//         (map['results'] as List<int>).map<TvSeriesSearchResult>(
//           (x) => TvSeriesSearchResult.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//       totalPages: map['totalPages'] as int,
//       totalResults: map['totalResults'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   // factory TvSeriesSearchResponse.fromJson(String source) =>
//   //     TvSeriesSearchResponse.fromMap(
//   //         json.decode(source) as Map<String, dynamic>);
// }

class TvSeriesSearchResult {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String? posterPath;
  final String firstAirDate;
  final String name;
  final double? voteAverage;
  final int? voteCount;

  TvSeriesSearchResult({
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
        posterPath: json['poster_path'] as String?,
        firstAirDate: json['first_air_date'] as String,
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
      firstAirDate: map['firstAirDate'] as String,
      name: map['name'] as String,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  // factory TvSeriesSearchResult.fromJson(String source) => TvSeriesSearchResult.fromMap(json.decode(source) as Map<String, dynamic>);

  // factory TvSeriesSearchResult.fromJson(String source) =>
  //     TvSeriesSearchResult.fromMap(json.decode(source) as Map<String, dynamic>);
}
