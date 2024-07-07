import 'dart:async';
import 'dart:convert';

import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';

class ApiService {
  final log = getLogger('ApiService');

//https://developer.themoviedb.org/reference/tv-episode-details
// Search TV series
// https://api.themoviedb.org/3/search/tv?query=supernatural&api_key=dotenv.env['API_KEY']
// https://api.themoviedb.org/3/search/tv?query=supernatural/reviews&api_key=dotenv.env['API_KEY']

// Steps
// Search TV series - https://api.themoviedb.org/3/search/tv?query=The+boys&api_key=dotenv.env['API_KEY']
  // selected name of the Series and grab the ID
  // Search Series on the basic of ID -  https://api.themoviedb.org/3/tv/{ID}?api_key=dotenv.env['API_KEY']
  // get list of Sessions
  // Search all the episode details from each Session
  // https://api.themoviedb.org/3/tv/{series_id}/season/{season_number}?api_key=dotenv.env['API_KEY']

  Future<dynamic> sendRequest({required String url}) async {
    log.i('sendRequest');
    // Make the HTTP GET request
    final response = await http.get(Uri.parse(url));

    // Check for successful response
    if (response.statusCode == 200) {
      log.i('Requst Response - ${response.statusCode}');
      // Decode the JSON response
      return jsonDecode(response.body);
    } else {
      // Handle error scenario
      log.e(response.statusCode);
      throw Exception('Failed to load TV series: ${response.statusCode}');
    }
  }

  Future<List<TvSeriesSearchResult>> fetchTvSeries(
      {required String url}) async {
    log.i('fetchTvSeries');
    try {
      final result = await sendRequest(url: url);
      final List<TvSeriesSearchResult> searchTvSeries =
          (result['results'] as List<dynamic>)
              .map((item) => TvSeriesSearchResult.fromJson(item))
              .toList();
      log.d(searchTvSeries[0].name);
      return searchTvSeries;
    } catch (e) {
      log.e(e);
      throw Exception(e);
    }
  }

  Future<List<TvSeriesSearchResult>> searchTvSeries(
      {required String seriesName}) async {
    log.i('searchTvSeries');
    String tvSeriesUrl =
        '${ApiConstants.searchTVSeriesUrl}$seriesName${ApiConstants.apiKey}';
    return await fetchTvSeries(url: tvSeriesUrl);
  }

  Future<List<TvSeriesSearchResult>> fetchTrandingTodayTvSeries() async {
    log.i('fetchTrandingTodayTvSeries');
    String tradingTodayUrl = ApiConstants.trandingTodayUrl;
    return await fetchTvSeries(url: tradingTodayUrl);
  }
}
