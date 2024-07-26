import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/hivedb_service.dart';
import 'package:watch_next/services/my_snackbar_service.dart';

class OnTapOverviewDialogModel extends BaseViewModel {
  final log = getLogger('OnTapOverviewDialogModel');
  final HivedbService _hivedbService = locator<HivedbService>();
  final MySnackbarService _snackbarService = locator<MySnackbarService>();
  final _apiService = locator<ApiService>();

  void undoActionButton() {}
  void addButtonClicked(TvSeriesSearchResult item) async {
// TODO add undo action
    log.i('${item.name} added into database');
    _snackbarService.customSnackbar(
        '${item.name} added into Watchlist', undoActionButton);
    TvSeriesItemModel? seriesDetails =
        _hivedbService.watchListItemDetailBox?.get(item.id);
    _hivedbService.addModel(item);
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
