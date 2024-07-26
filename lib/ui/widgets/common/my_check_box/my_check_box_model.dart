import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/hivedb_service.dart';
import 'package:watch_next/services/my_snackbar_service.dart';

class MyCheckBoxModel extends BaseViewModel {
  final log = getLogger('MyCheckBoxModel');

  final _hivedbService = locator<HivedbService>();
  final _apiService = locator<ApiService>();
  final MySnackbarService _snackbarService = locator<MySnackbarService>();
  bool _isUndo = false;

  void undoActionButton() {
    _isUndo = true;
  }

  void toggleCheckedFromWatchListView(
      bool value, TvSeriesSearchResult item, String message) {
    log.i('toggleCheckedFromWatchListView');
    log.i('toggleChecked ${item.name}');
    _hivedbService.removeModel(item);
    item.isChecked = false;
    log.i('Model Removed ${item.name}');

    _snackbarService.customSnackbar(
        '${item.name} removed from Watchlist', undoActionButton);
    rebuildUi();
  }

  void toggleCheckedFromDiscoverView(
      bool value, TvSeriesSearchResult item, String message) async {
    log.i('toggleCheckedFromDiscoverView');
    if (value) {
      // _snackbarService.customSnackbar('${item.name} added into Watchlist');
      _snackbarService.customSnackbar(
          '${item.name} added into Watchlist', undoActionButton);

      if (!_isUndo) {
        item.isChecked = value;
        _hivedbService.addModel(item);
        //TODO fetch item details and add the detail
        TvSeriesItemModel? seriesDetails =
            _hivedbService.watchListItemDetailBox?.get(item.id);

        if (seriesDetails == null) {
          // log.i('model already exist - $contentId');

          // fetch selected name of the Series and grab the ID
          // Search Series on the basic of ID - https://api.themoviedb.org/3/tv/{ID}?api_key=dotenv.env['API_KEY']
          final url =
              '${ApiConstants.searchTVSeasonsUrl}${item.id}?${ApiConstants.apiKey}';

          seriesDetails = await _apiService.fetchTvSeriesDetails(url: url);
          _hivedbService.addModelDetails(seriesDetails);
        }

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
