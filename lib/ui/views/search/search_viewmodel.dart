import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';

import 'package:watch_next/services/searchquery_service.dart';
import 'package:watch_next/ui/widgets/common/searchfield/searchfield.form.dart';

class SearchViewModel extends FormViewModel {
  final log = getLogger('SearchViewModel');
  final _searchService = locator<SearchqueryService>();

  Future<void> getSeriesName(value) async {
    log.i('$value - $searchFieldValue');
    _searchService.searchQuerySet(searchFieldValue);
  }

  void watchListTabClicked() {
    // rebuildUi();
  }

  void discoverTabClicked() {}
}
