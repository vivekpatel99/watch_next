import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/hivedb_service.dart';
import 'package:watch_next/services/my_snackbar_service.dart';
import 'package:watch_next/services/searchquery_service.dart';

class TabviewDiscoverModel extends ReactiveViewModel {
  final _apiService = locator<ApiService>();
  final _searchService = locator<SearchqueryService>();
  final _hiveService = locator<HivedbService>();
  final MySnackbarService _snackbarService = locator<MySnackbarService>();
  bool _isUndo = false;

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
      String tvSeriesUrl =
          '${ApiConstants.searchTVSeriesUrl}${_searchService.searchQuery!}&${ApiConstants.apiKey}';
      _fetchedData = await _apiService.fetchTvSeries(url: tvSeriesUrl);
      log.i('searchTvSeries data lenght - ${_fetchedData.length}');
    } else {
      String tradingTodayUrl = ApiConstants.trandingTodayUrl;
      _fetchedData = await _apiService.fetchTvSeries(url: tradingTodayUrl);
      log.i('fetchTrandingTodayTvSeries data lenght - ${_fetchedData.length}');
    }

    return _fetchedData;
  }

  void undoActionButton() {
    _isUndo = true;
  }

  void toggleChecked(bool value, TvSeriesSearchResult item) async {
    if (value) {
      _snackbarService.customSnackbar('${item.name} added into Watchlist');

      if (!_isUndo) {
        item.isChecked = value;
        _hiveService.addModel(item);
        log.i('Model added ${item.name}');
        // fetch selected name of the Series and grab the ID
        // Search Series on the basic of ID -  https://api.themoviedb.org/3/tv/{ID}?api_key=dotenv.env['API_KEY']
        final url =
            '${ApiConstants.searchTVSeasonsUrl}${item.id}?${ApiConstants.apiKey}';
        log.d(url);
        TvSeriesItemModel seriesDetails =
            await _apiService.fetchTvSeriesDetails(url: url);

        log.d(seriesDetails);
        // get list of Sessions
        // Search all the episode details from each Session
        rebuildUi();
        return;
      }
    }

    item.isChecked = value;

    _snackbarService.customSnackbar(
        '${item.name} will not be added into Watchlist', undoActionButton);

    rebuildUi();
  }
}
