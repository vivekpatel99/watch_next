import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/common/mylogger.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/api_service.dart';

class TabviewDiscoverModel extends FutureViewModel {
  final _apiService = locator<ApiService>();
  final log = getLogger('TabviewModel');
  // late String? _searchSeries;

  // String getSerisName(String name) {
  //   _searchSeries = name;
  //   log.i('Searched String "$name"');
  //   return name;
  // }

  @override
  Future<List<TvSeriesSearchResult>> futureToRun() {
    // final List<TvSeriesSearchResult> result =

    return _apiService.searchTvSeries(seriesName: 'the boys');
  }
}
