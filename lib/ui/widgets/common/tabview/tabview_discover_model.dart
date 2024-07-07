import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/searchquery_service.dart';

class TabviewDiscoverModel extends ReactiveViewModel {
  final _apiService = locator<ApiService>();
  final _searchService = locator<SearchqueryService>();

  late List<TvSeriesSearchResult> _fetchedData;

  final log = getLogger('TabviewDiscoverModel');

  @override
  List<ListenableServiceMixin> get listenableServices => [_searchService];

  bool getIsChecked(int id) {
    final index = _fetchedData.indexWhere((item) => item.id == id);
    print('################$index');
    if (index != -1) {
      return _fetchedData[index].isChecked ?? false;
    }
    return false;
  }

  Future<List<TvSeriesSearchResult>> futureToRun() async {
    log.i('futureToRun');
    if (_searchService.searchQuery != null) {
      log.i('searchvalue ${_searchService.searchQuery}');
      _fetchedData = await _apiService.searchTvSeries(
          seriesName: _searchService.searchQuery!);

      log.i('searchTvSeries data lenght - ${_fetchedData.length}');
    } else {
      _fetchedData = await _apiService.fetchTrandingTodayTvSeries();
      log.i('fetchTrandingTodayTvSeries data lenght - ${_fetchedData.length}');
    }

    return _fetchedData;
  }

  void toggleChecked(bool? value, TvSeriesSearchResult item) {
    if (value != null) {
      item.isChecked = true;
    } else {
      item.isChecked = false;
    }
    rebuildUi();
  }
}
