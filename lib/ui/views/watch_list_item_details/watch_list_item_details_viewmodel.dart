import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/datamodels/series_item_model.dart';
import 'package:watch_next/services/hivedb_service.dart';

class WatchListItemDetailsViewModel extends BaseViewModel {
  final _hivedbService = locator<HivedbService>();
  final _navigationService = locator<NavigationService>();

  void backButtonClicked() => _navigationService.back();

  TvSeriesItemModel seriesDetails({required int id}) {
    return _hivedbService.watchListItemDetailBox!.get(id);
  }
}
