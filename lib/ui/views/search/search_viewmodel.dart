import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/app/app.router.dart';

import 'package:watch_next/services/searchquery_service.dart';
import 'package:watch_next/ui/widgets/common/searchfield/searchfield.form.dart';

class SearchViewModel extends FormViewModel {
  final log = getLogger('SearchViewModel');
  final _searchService = locator<SearchqueryService>();
  final _navigationService = locator<NavigationService>();

  Future<void> getSeriesName(value) async {
    log.i('$value - $searchFieldValue');
    _searchService.searchQuerySet(searchFieldValue);
  }

  Future backButtonClicked() async {
    log.i('searchButtonClicked');
    _navigationService.navigateToHomeView();
  }
}
