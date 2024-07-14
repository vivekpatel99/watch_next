/// dart run build_runner build -d
///
import 'dart:convert';
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
    late ApiService apiService;
    late MockApiService mockApiService;
    late MockClient mockClient;

    const responseJson = '{"results": [{"name": "Supernatural"}]}';
    setUp(() {
      registerServices();
      mockApiService = getAndRegisterApiService();
      apiService = locator<ApiService>();
      mockClient = MockClient();
    });
    tearDown(() => locator.reset());

    group('SendRequest -', () {
      test('sendRequest returns data if the http call completes successfully',
          () async {
        when(mockApiService.sendRequest(url: anyNamed('url')))
            .thenAnswer((_) async => jsonDecode(responseJson));

        final result = await apiService.sendRequest(url: 'test_url');

        expect(result['results'][0]['name'], 'Supernatural');
      });

      test(
          'sendRequest throws an exception if the http call completes with an error',
          () async {
        when(mockApiService.sendRequest(url: anyNamed('url')))
            .thenThrow(Exception('Failed to load TV series'));

        expect(() async => await apiService.sendRequest(url: 'test_url'),
            throwsException);
      });
    });

    group('fetchTvSeries -', () {
      // test(
      //     'fetchTvSeries returns list of TvSeriesSearchResult if the http call completes successfully',
      //     () async {

      //   when(mockApiService.sendRequest(url: anyNamed('url')))
      //       .thenAnswer((_) async => jsonDecode(responseJson));

      //   final result = await apiService.fetchTvSeries(url: 'test_url');

      //   expect(result, isA<List<TvSeriesSearchResult>>());
      //   expect(result[0].name, 'Supernatural');
      // });

      // test(
      //     'searchTvSeries returns list of TvSeriesSearchResult if the http call completes successfully',
      //     () async {
      //   when(mockClient.get(any))
      //       .thenAnswer((_) async => http.Response(responseJson, 200));

      //   final result =
      //       await apiService.searchTvSeries(seriesName: 'supernatural');

      //   expect(result, isA<List<TvSeriesSearchResult>>());
      //   expect(result[0].name, 'Supernatural');
      // });
    });

    group('fetchTrendingTodayTvSeries -', () {
      apiService = ApiService(client: mockClient);

      test(
          'fetchTrendingTodayTvSeries returns list of TvSeriesSearchResult if the http call completes successfully',
          () async {
        when(mockClient.get(any))
            .thenAnswer((_) async => http.Response(responseJson, 200));

        final result = await apiService.fetchTrandingTodayTvSeries();

        expect(result, isA<List<TvSeriesSearchResult>>());
        expect(result.first.name, 'Supernatural');
      });
    });
  });
}
