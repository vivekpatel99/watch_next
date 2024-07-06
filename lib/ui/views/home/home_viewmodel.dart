import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final log = getLogger('HomeViewModel');
  final _navigationService = locator<NavigationService>();

  String get counterLabel => 'Counter is: $_counter';

  final int _counter = 0;

  Future searchButtonClicked() async {
    log.i('searchButtonClicked');
    _navigationService.navigateToSearchView();
  }
}
