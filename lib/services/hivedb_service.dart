import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/constansts.dart';
import 'package:watch_next/datamodels/created_by.dart';
import 'package:watch_next/datamodels/genre.dart';
import 'package:watch_next/datamodels/network.dart';
import 'package:watch_next/datamodels/next_episode_to_air.dart';
import 'package:watch_next/datamodels/season.dart';
import 'package:watch_next/datamodels/series_item_model.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HivedbService {
  final log = getLogger('HivedbService');

  Box<TvSeriesSearchResult>? _watchListBox;
  Box<TvSeriesItemModel>? _watchListItemDetailBox;

  Future<void> init() async {
    log.i('init');
    final dir = await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    // Open the box if not already opened
    if (!Hive.isBoxOpen(Constansts.watchListBox)) {
      log.i('!Hive.isBoxOpen is True');
      Hive.registerAdapter(TvSeriesSearchResultAdapter());
      log.i('TvSeriesSearchResultAdapter registered');

      _watchListBox = await Hive.openBox(Constansts.watchListBox);
      // await _watchListBox!.clear();
      log.d('_watchListBox - $_watchListBox');
    } else {
      _watchListBox = Hive.box<TvSeriesSearchResult>(Constansts.watchListBox);
      log.d('_watchListBox - $_watchListBox');
      log.i(
          '!Hive.isBoxOpen is False and _watchListBox is set with box                             ');
    }

    if (!Hive.isBoxOpen(Constansts.watchListItemDetailBox)) {
      log.i('!Hive.isBoxOpen is True');

      Hive.registerAdapter(CreatedByAdapter());
      log.i('CreatedByAdapter registered');

      Hive.registerAdapter(GenreAdapter());
      log.i('GenreAdapter registered');

      Hive.registerAdapter(NetworkAdapter());
      log.i('NetworkAdapter registered');

      Hive.registerAdapter(NextEpisodeToAirAdapter());
      log.i('NextEpisodeToAirAdapter registered');

      Hive.registerAdapter(SeasonAdapter());
      log.i('SeasonAdapter registered');

      Hive.registerAdapter(TvSeriesItemModelAdapter());
      log.i('TvSeriesItemModelAdapter registered');

      _watchListItemDetailBox =
          await Hive.openBox(Constansts.watchListItemDetailBox);
      // await _watchListBox!.clear();
      log.d('_watchListItemDetailBox - $_watchListItemDetailBox');
    } else {
      _watchListItemDetailBox =
          Hive.box<TvSeriesItemModel>(Constansts.watchListItemDetailBox);
      log.d('_watchListItemDetailBox - $_watchListItemDetailBox');
      log.i(
          '!Hive.isBoxOpen is False and _watchListBox is set with box                             ');
    }
  }

  Box? get getwatchListBox {
    if (_watchListBox == null) {
      log.d('_watchListBox is null - $_watchListBox');
    }
    return _watchListBox;
  }

  Box? get watchListItemDetailBox {
    if (_watchListItemDetailBox == null) {
      log.d('_watchListBox is null - $_watchListItemDetailBox');
    }
    return _watchListItemDetailBox;
  }

  void addModel(TvSeriesSearchResult model) async {
    try {
      if (_watchListBox?.get(model.id) != null) {
        log.i('model already exist - ${model.name}');
        return;
      } else {
        _watchListBox!.put(model.id, model);
        log.i('model added - ${model.name}');
      }
    } catch (e) {
      log.e(e);
    }
  }

  void addModelDetails(TvSeriesItemModel model) async {
    try {
      if (_watchListItemDetailBox?.get(model.id) != null) {
        log.i('model already exist - ${model.name}');
        return;
      } else {
        _watchListItemDetailBox!.put(model.id, model);
        log.i('model added - ${model.name}');
      }
    } catch (e) {
      log.e(e);
    }
  }

  void removeModel(TvSeriesSearchResult model) async {
    log.i('model removed - ${model.name}');
    await _watchListBox!.delete(model.id);
    await _watchListItemDetailBox!.delete(model.id);
  }
}
