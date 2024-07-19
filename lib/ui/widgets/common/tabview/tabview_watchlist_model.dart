import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/services/hivedb_service.dart';

class TabviewWatchListModel extends BaseViewModel {
  final log = getLogger('TabviewWatchListModel');
  final _hiveService = locator<HivedbService>();

  Box? get getWatchListBox => _hiveService.getwatchListBox;
}
