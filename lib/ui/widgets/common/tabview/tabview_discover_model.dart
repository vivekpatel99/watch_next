import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/ui/views/search/search_view.form.dart';

class TabviewDiscoverModel extends FutureViewModel with FormStateHelper {
  final _apiService = locator<ApiService>();
  final log = getLogger('TabviewDiscoverModel');

  Future<void> searchTvSeries() async {
    await initialise();
  }

  @override
  Future<List<TvSeriesSearchResult>> futureToRun() {
    log.i('futureToRun');
    if (searchQueryValue != null) {
      log.i('searchvalue $searchQueryValue');
      return _apiService.searchTvSeries(seriesName: searchQueryValue!);
    } else {
      return _apiService.fetchTrandingTodayTvSeries();
    }
  }
}
