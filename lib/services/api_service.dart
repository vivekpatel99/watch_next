import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:retry/retry.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:http/http.dart' as http;
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';

class ApiService {
  final log = getLogger('ApiService');
  http.Client client;
  ApiService({http.Client? client}) : client = client ?? http.Client();

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
    // TODO use Either and throw Error when 3 try attempt finishes
    log.i('sendRequest');
    // http.Response? response;

    const retryOption = RetryOptions(
      maxAttempts: 3, // Number of retry attempts
      delayFactor: Duration(seconds: 3), // Initial delay between retries
    );

    // Get statusCode by retrying a function
    try {
      final response = await retryOption.retry(
        () => client.get(Uri.parse(url)).timeout(const Duration(seconds: 5)),
        retryIf: (e) => e is SocketException || e is TimeoutException,
        onRetry: (attempt) =>
            log.w('Failed to connect to server. Retrying... ($attempt)'),
      );

      if (response.statusCode == 200) {
        log.i('Request Response - ${response.statusCode}');
        return jsonDecode(response.body);
      } else {
        log.e('Failed to load TV series: ${response.statusCode}');
        throw Exception('Failed to load TV series: ${response.statusCode}');
      }
    } catch (e) {
      log.e('Request failed: $e');
      throw Exception('Request failed: $e');
    }
  }

  void dispose() {
    client.close();
  }

  Future<List<TvSeriesSearchResult>> fetchTvSeries(
      {required String url}) async {
    log.i('fetchTvSeries');
    try {
      final result = await sendRequest(url: url);
      if (result['results'] == null) {
        throw Exception('No results found');
      }
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

  Future<TvSeriesItemModel> fetchTvSeriesDetails({required String url}) async {
    log.i('fetchTvSeriesDetails');
    try {
      final result = await sendRequest(url: url);
      if (result == null) {
        throw Exception('No results found');
      }
      final TvSeriesItemModel seriesDetails =
          TvSeriesItemModel.fromJson(result);
      log.d(seriesDetails.name);
      return seriesDetails;
    } catch (e) {
      log.e(e);
      throw Exception(e);
    }
  }
}
