import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/common/mylogger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/ui/views/search/search_view.form.dart';

class TabviewDiscoverModel extends FutureViewModel with FormStateHelper {
  final _apiService = locator<ApiService>();
  final log = getLogger('TabviewDiscoverModel');
  // late String? _searchSeries;

  // String getSerisName(String name) {
  //   _searchSeries = name;

  //   log.i('Searched String "$name"');
  //   return name;
  // }
  Future<List<TvSeriesSearchResult>> searchTvSeries() {
    log.i('searchvalue $searchQueryValue');
    return _apiService.searchTvSeries(seriesName: searchQueryValue!);
  }

  @override
  Future<List<TvSeriesSearchResult>> futureToRun() {
    log.i('futureToRun');
    Future<List<TvSeriesSearchResult>> tradningToday =
        _apiService.fetchTrandingTodayTvSeries();
    print(tradningToday);
    return tradningToday;
  }
}
