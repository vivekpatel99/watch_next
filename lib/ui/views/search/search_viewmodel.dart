import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/common/mylogger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';

class SearchViewModel extends BaseViewModel {
  final log = getLogger('SearchViewModel');

  // String getSeriesName() =>
  void watchListTabClicked() {
    // rebuildUi();
  }

  void discoverTabClicked() {}
}
