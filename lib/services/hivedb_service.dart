import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/constansts.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HivedbService {
  final log = getLogger('HivedbService');

  Box<TvSeriesSearchResult>? _watchListBox;

  Future<void> init() async {
    log.i('init');
    final dir = await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    // Open the box if not already opened
    if (!Hive.isBoxOpen(Constansts.watchListBox)) {
      log.i('!Hive.isBoxOpen is True');
      Hive.registerAdapter(TvSeriesSearchResultAdapter());
      log.i('TvSeriesSearchResultAdapter registered');
      _watchListBox =
          await Hive.openBox<TvSeriesSearchResult>(Constansts.watchListBox);
      log.d('_watchListBox - $_watchListBox');
    } else {
      _watchListBox = Hive.box<TvSeriesSearchResult>(Constansts.watchListBox);
      log.d('_watchListBox - $_watchListBox');
      log.i('!Hive.isBoxOpen is False and _watchListBox is set with box');
    }
  }

  Box? get getwatchListBox {
    if (_watchListBox == null) {
      log.d('_watchListBox is null - $_watchListBox');
    }
    return _watchListBox;
  }

  void addModel(TvSeriesSearchResult model) {
    try {
      _watchListBox!.put(model.id, model);
      log.i('model added - ${model.name}');
    } catch (e) {
      log.e(e);
    }
  }

  void removeModel(TvSeriesSearchResult model) async {
    log.i('model removed - ${model.name}');
    await _watchListBox!.delete(model.id);
  }
}