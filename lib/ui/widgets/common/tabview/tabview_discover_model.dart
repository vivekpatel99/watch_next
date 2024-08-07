import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/searchquery_service.dart';

class TabviewDiscoverModel extends ReactiveViewModel {
  final _apiService = locator<ApiService>();
  final _searchService = locator<SearchqueryService>();

  List<TvSeriesSearchResult>? _fetchedData;
  final log = getLogger('TabviewDiscoverModel');

  @override
  List<ListenableServiceMixin> get listenableServices => [_searchService];

  bool getIsChecked(int id) {
    final index = _fetchedData!.indexWhere((item) => item.id == id);

    if (index != -1) {
      return _fetchedData![index].isChecked;
    }
    return false;
  }

  Future<List<TvSeriesSearchResult>?> futureToRun() async {
    log.i('futureToRun');

    try {
      if (_searchService.searchQuery != null) {
        log.i('searchvalue ${_searchService.searchQuery}');
        String tvSeriesUrl =
            '${ApiConstants.searchTVSeriesUrl}${_searchService.searchQuery!}&${ApiConstants.apiKey}';
        _fetchedData = await _apiService.fetchTvSeries(url: tvSeriesUrl);
        log.i('searchTvSeries data lenght - ${_fetchedData!.length}');
      } else {
        String tradingTodayUrl = ApiConstants.trandingTodayUrl;
        _fetchedData = await _apiService.fetchTvSeries(url: tradingTodayUrl);
        log.i(
            'fetchTrandingTodayTvSeries data lenght - ${_fetchedData!.length}');
      }
      return _fetchedData!;
    } catch (e) {
      log.e(e);
      setError(e.toString());
      return null;

      // setError('something went wrong');
      // setBusy(false);
      // return Left(ServerException(e.toString()));
    }
    // setBusy(false);
  }
}
