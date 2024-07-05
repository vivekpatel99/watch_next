import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/common/mylogger.dart';
import 'package:watch_next/services/api_service.dart';

class TabviewWatchListModel extends FutureViewModel {
  final _apiService = locator<ApiService>();
  final log = getLogger('TabviewModel');
  // late String? _searchSeries;

  // String getSerisName(String name) {
  //   _searchSeries = name;
  //   log.i('Searched String "$name"');
  //   return name;
  // }

  @override
  Future futureToRun() {
    return _apiService.searchTvSeries(seriesName: 'the boys');
  }
}
