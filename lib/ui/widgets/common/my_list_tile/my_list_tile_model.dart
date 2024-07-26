import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/app/app.dialogs.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/services/hivedb_service.dart';

class MyListTileModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _hivedbService = locator<HivedbService>();

  final _apiService = locator<ApiService>();
  final log = getLogger('MyListTileModel');
  void showDialog({required int contentId}) async {
    log.i('showDialog with $contentId');

    TvSeriesItemModel? seriesDetails =
        _hivedbService.watchListItemDetailBox?.get(contentId);

    if (seriesDetails == null) {
      // log.i('model already exist - $contentId');

      // fetch selected name of the Series and grab the ID
      // Search Series on the basic of ID - https://api.themoviedb.org/3/tv/{ID}?api_key=dotenv.env['API_KEY']
      final url =
          '${ApiConstants.searchTVSeasonsUrl}$contentId?${ApiConstants.apiKey}';

      seriesDetails = await _apiService.fetchTvSeriesDetails(url: url);
    }

    log.d(seriesDetails);
    // get list of Sessions
    // Search all the episode details from each Session
    _dialogService.showCustomDialog(
        barrierDismissible: true,
        variant: DialogType.onTapOverview,
        hasImage: true,
        data: seriesDetails,
        title: seriesDetails.name,
        description: seriesDetails.overview,
        imageUrl: seriesDetails.posterPath,
        mainButtonTitle: 'Add Show',
        additionalButtonTitle: 'Dismiss');
  }
}
