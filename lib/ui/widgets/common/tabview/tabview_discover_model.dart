import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/hivedb_service.dart';
import 'package:watch_next/services/searchquery_service.dart';

class TabviewDiscoverModel extends ReactiveViewModel {
  final _apiService = locator<ApiService>();
  final _searchService = locator<SearchqueryService>();
  final _hiveService = locator<HivedbService>();

  late List<TvSeriesSearchResult> _fetchedData;

  final log = getLogger('TabviewDiscoverModel');

  @override
  List<ListenableServiceMixin> get listenableServices => [_searchService];

  bool getIsChecked(int id) {
    final index = _fetchedData.indexWhere((item) => item.id == id);

    if (index != -1) {
      return _fetchedData[index].isChecked;
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
      _hiveService.addModel(item);
      log.i('Model added ${item.name}');
      // TODO Add snackber to display message
    } else {
      item.isChecked = false;
      // TODO Add snackber to display message
    }
    rebuildUi();
  }
}
