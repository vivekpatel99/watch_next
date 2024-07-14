/// dart run build_runner build -d
///
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import 'package:http/http.dart' as http;
import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiServiceTest -', () {
    late MockApiService mockApiService;

    MockClient mockClient = MockClient();
    var apiService = ApiService(client: mockClient);
    const responseJsonStr = '{"results": [{"name": "The Boys"}]}';

    setUp(() async {
      registerServices();
      mockApiService = getAndRegisterApiService();
      await dotenv.load(fileName: "assets/.env");
    });

    tearDown(() => locator.reset());

    group('Construct ApiService -', () {
      test('Constructing Service should find correct dependencies', () {
        expect(apiService != null, true);
      });
    });

    group('SendRequest -', () {
      const testUrl = 'test_url';
      test('sendRequest returns data if the HTTP call completes successfully',
          () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response('Not Found', 404));

        expect(() async => await apiService.sendRequest(url: testUrl),
            throwsException);
      });
      test(
          'sendRequest throws an exception if the http call completes with an error',
          () async {
        when(mockApiService.sendRequest(url: anyNamed('url')))
            .thenThrow(Exception('Failed to load TV series'));

        expect(() async => await apiService.sendRequest(url: testUrl),
            throwsException);
      });
      test('sendRequest returns data if the HTTP call completes successfully',
          () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response(responseJsonStr, 200));

        final result = await apiService.sendRequest(url: 'test_url');
        final decodedResult = jsonDecode(responseJsonStr);

        expect(
            result['results'][0]['name'], decodedResult['results'][0]['name']);
      });
    });
    group('fetchTvSeries -', () {
      test(
          'fetchTvSeries returns list of TvSeriesSearchResult if the http call completes successfully',
          () async {
        const responseJson = {
          "results": [
            {
              "backdrop_path": "",
              "id": 76479,
              "name": "The Boys",
              "original_name": "",
              "overview": "",
              "poster_path": "",
              "media_type": "tv",
              "adult": false,
              "original_language": "en",
              "genre_ids": [],
              "popularity": 2485.72,
              "first_air_date": "",
              "vote_average": 8.2,
              "vote_count": 9911,
              "origin_country": []
            },
          ],
        };

        when(mockClient.get(any)).thenAnswer(
            (_) async => http.Response(jsonEncode(responseJson), 200));
        var apiService = ApiService(client: mockClient);
        final result = await apiService.fetchTvSeries(url: 'test_url');

        expect(result, isA<List<TvSeriesSearchResult>>());

        expect(result[0].name, "The Boys");
      });
    });
  });
}
