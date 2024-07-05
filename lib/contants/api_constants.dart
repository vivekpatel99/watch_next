import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  // static String skSearchTVSeries =
  //     '${dotenv.env['API_ENDPOINT']}search/tv?query=The boys&api_key=${dotenv.env['API_KEY']}';
  // static String skFetchTVSeriesDetails =
  //     '${dotenv.env['API_ENDPOINT']}tv/{series_id}?api_key=${dotenv.env['API_KEY']}';
  // static String skFetchTVSeriesEpisodes =
  //     '${dotenv.env['API_ENDPOINT']}tv/{series_id}/season/{season_number}?api_key=${dotenv.env['API_KEY']}';
  static String apiEndpoint = dotenv.env['API_ENDPOINT']!;
  static String apiImageEndpoint = dotenv.env['API_ENDPOINT_IMAGE_PATH']!;
  static String apiKey = dotenv.env['API_KEY']!;

  static String searchTVSeriesUrl = '${apiEndpoint}search/tv?query=';
  static String trandingTodayUrl = '$trandingTodayUrl?query=';
  static String fetchTVSeriesInfoUrl = '${apiEndpoint}tv/';
  // static String fetchTVSeriesEpisodesUrl = '${apiEndpoint}search/tv?query=';

  // static String constructSearchTVSeriesUrl({required String tvSeriesName}) {
  //   return '${apiEndpoint}search/tv?query=$tvSeriesName&api_key=$apiKey';
  // }

  // static String constructFetchTVSeriesDetailsUrl({required int seriesId}) {
  //   return '${apiEndpoint}tv/$seriesId?api_key=$apiKey}';
  // }

  // static String constructFetchTVSeriesEpisodesUrl(
  //     {required int seriesId, required int seasonNumber}) {
  //   return '${apiEndpoint}tv/$seriesId/season/$seasonNumber}?api_key=$apiKey';
  // }
}
