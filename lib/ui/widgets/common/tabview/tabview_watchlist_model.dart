import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/hivedb_service.dart';
import 'package:watch_next/services/my_snackbar_service.dart';

class TabviewWatchListModel extends BaseViewModel {
  final log = getLogger('TabviewWatchListModel');
  final _hiveService = locator<HivedbService>();
  final MySnackbarService _snackbarService = locator<MySnackbarService>();

  Box? get getWatchListBox => _hiveService.getwatchListBox;
  void undoActionButton() {}

  void toggleChecked(bool? value, TvSeriesSearchResult item) {
    log.i('toggleChecked ${item.name}');
    _hiveService.removeModel(item);
    item.isChecked = false;
    log.i('Model Removed ${item.name}');

    _snackbarService.customSnackbar(
        '${item.name} removed from Watchlist', undoActionButton);
  }
}
