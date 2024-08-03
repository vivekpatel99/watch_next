/// dart run build_runner build -d
///
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
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
    const mockErrorResponse = '''{
                "success": false,
                "status_code": 34,
                "status_message": "The resource you requested could not be found."
              }''';
    const String url = 'http://example.com/tvseries';
    const mockResponse = '''{
        "adult": false,
        "backdrop_path": "/kwronSXO1ogMqHHFvY2eBxfFLdn.jpg",
        "created_by": [
          {
            "id": 217587,
            "credit_id": "63692d911684f7007a9beaa4",
            "name": "Leslye Headland",
            "original_name": "Leslye Headland",
            "gender": 1,
            "profile_path": "/tHrxGDqAp89F9m0ISRUuuUeKrb4.jpg"
          }
        ],
        "episode_run_time": [],
        "first_air_date": "2024-06-04",
        "genres": [
          {
            "id": 9648,
            "name": "Mystery"
          },
          {
            "id": 10765,
            "name": "Sci-Fi & Fantasy"
          }
        ],
        "homepage": "https://www.disneyplus.com/series/the-acolyte/39RAA0bOYXQ0",
        "id": 114479,
        "in_production": true,
        "languages": [
          "en"
        ],
        "last_air_date": "2024-07-16",
        "last_episode_to_air": {
          "id": 5220959,
          "name": "The Acolyte",
          "overview": "Confrontation and revelation await.",
          "vote_average": 5.0,
          "vote_count": 18,
          "air_date": "2024-07-16",
          "episode_number": 8,
          "episode_type": "finale",
          "production_code": "",
          "runtime": 49,
          "season_number": 1,
          "show_id": 114479,
          "still_path": "/ofLhs7Ko9MYKQ9Gdlr9lRHC4wPz.jpg"
        },
        "name": "The Acolyte",
        "next_episode_to_air": null,
        "networks": [
          {
            "id": 2739,
            "logo_path": "/1edZOYAfoyZyZ3rklNSiUpXX30Q.png",
            "name": "Disney+",
            "origin_country": ""
          }
        ],
        "number_of_episodes": 8,
        "number_of_seasons": 1,
        "origin_country": [
          "US"
        ],
        "original_language": "en",
        "original_name": "The Acolyte",
        "overview": "A hundred years before the rise of the Empire, the Jedi Order and the Galactic Republic have prospered for centuries without war. During this time, an investigation into a shocking crime spree pits a Jedi Master against a dangerous warrior from his past.",
        "popularity": 427.426,
        "poster_path": "/bnVL7o0r7rnOIFZMHr6eoDigpON.jpg",
        "production_companies": [
          {
            "id": 1,
            "logo_path": "/tlVSws0RvvtPBwViUyOFAO0vcQS.png",
            "name": "Lucasfilm Ltd.",
            "origin_country": "US"
          },
          {
            "id": 199908,
            "logo_path": null,
            "name": "Shoot to Midnight",
            "origin_country": "US"
          }
        ],
        "production_countries": [
          {
            "iso_3166_1": "US",
            "name": "United States of America"
          }
        ],
        "seasons": [
          {
            "air_date": "2024-06-03",
            "episode_count": 8,
            "id": 171720,
            "name": "Season 1",
            "overview": "",
            "poster_path": "/nBopI4mZqjQKXw54kesDgKG2pbJ.jpg",
            "season_number": 1,
            "vote_average": 4.9
          }
        ],

        "status": "Returning Series",
        "tagline": "In an age of light, a darkness rises.",
        "type": "Scripted",
        "vote_average": 5.731,
        "vote_count": 390
      }''';

    setUp(() async {
      registerServices();
      mockApiService = getAndRegisterApiService();
      await dotenv.load(fileName: "assets/.env");
    });

    tearDown(() => locator.reset());

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
              "first_air_date": "2005-09-13",
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
    group('fetchTvSeriesDetails', () {
      test('should return TvSeriesItemModel on success', () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response(mockResponse, 200));

        when(mockApiService.sendRequest(url: url))
            .thenAnswer((_) async => mockResponse);

        final result = await apiService.fetchTvSeriesDetails(url: url);

        expect(result, isA<TvSeriesItemModel>());
        expect(result.id, 114479);
        expect(result.name, "The Acolyte");
      });

      test('should throw exception when result is null', () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response(mockErrorResponse, 404));
        expect(() => apiService.fetchTvSeriesDetails(url: url),
            throwsA(isA<Exception>()));
      });

      test('should throw exception when result is not a Map', () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response(mockErrorResponse, 404));
        when(mockApiService.sendRequest(url: url))
            .thenAnswer((_) async => 'invalid');

        expect(() => apiService.fetchTvSeriesDetails(url: url),
            throwsA(isA<Exception>()));
      });

      test('should throw exception on error', () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response(mockErrorResponse, 404));
        when(mockApiService.sendRequest(url: url))
            .thenThrow(Exception('Error'));

        expect(() => apiService.fetchTvSeriesDetails(url: url),
            throwsA(isA<Exception>()));
      });
    });
  });
}
