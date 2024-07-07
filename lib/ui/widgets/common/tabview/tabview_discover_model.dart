import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/searchquery_service.dart';

class TabviewDiscoverModel extends ReactiveViewModel {
  final _apiService = locator<ApiService>();
  final _searchService = locator<SearchqueryService>();

  final log = getLogger('TabviewDiscoverModel');

  @override
  List<ListenableServiceMixin> get listenableServices => [_searchService];

  Future<List<TvSeriesSearchResult>> futureToRun() {
    log.i('futureToRun');

    if (_searchService.searchQuery != null) {
      log.i('searchvalue ${_searchService.searchQuery}');
      return _apiService.searchTvSeries(
          seriesName: _searchService.searchQuery!);
    } else {
      return _apiService.fetchTrandingTodayTvSeries();
    }
  }
}
