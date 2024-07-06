import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.logger.dart';

import 'package:watch_next/common/mylogger.dart';

class TabviewWatchListModel extends FutureViewModel {
  final log = getLogger('TabviewWatchListModel');

  // TODO add Hive Database Watchlist
  @override
  Future futureToRun() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
