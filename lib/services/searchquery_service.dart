import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.logger.dart';

class SearchqueryService with ListenableServiceMixin {
  final log = getLogger('SearchqueryService');
  String? _searchValue;

  SearchqueryService() {
    listenToReactiveValues([_searchValue]);
  }

  String? get searchQuery => _searchValue;

  void searchQuerySet(value) {
    log.i('searchQuerySet - $value');
    _searchValue = value;
    notifyListeners();
  }
}
