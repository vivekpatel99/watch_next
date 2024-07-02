import 'package:watch_next/app/app.bottomsheets.dart';
import 'package:watch_next/app/app.dialogs.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.router.dart';
import 'package:watch_next/common/mylogger.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/ui/views/search/search_view.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  Future searchButtonClicked() async {
    log.i('searchButtonClicked');
    _navigationService.navigateToSearchView();
    // await ApiService().searchTvSeries(seriesName: 'The boys');

    // rebuildUi();
  }

  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }

  // void showBottomSheet() {
  //   _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.notice,
  //     title: ksHomeBottomSheetTitle,
  //     description: ksHomeBottomSheetDescription,
  //   );
  // }
}
