import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/ui/views/search/search_view.form.dart';

class SearchViewModel extends FormViewModel {
  final log = getLogger('SearchViewModel');
  // final _apiService = locator<ApiService>();

  // String getSeriesName() =>
  void watchListTabClicked() {
    // rebuildUi();
  }

  void discoverTabClicked() {}
}
