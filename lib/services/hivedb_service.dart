import 'package:hive_flutter/hive_flutter.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.logger.dart';
import 'package:watch_next/contants/api_constants.dart';
import 'package:watch_next/contants/constansts.dart';
import 'package:watch_next/datamodels/series_item_model.dart';

import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:watch_next/services/api_service.dart';

class HivedbService {
  final log = getLogger('HivedbService');
  final ApiService _apiService = locator<ApiService>();

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

  void addModel(TvSeriesSearchResult model) async {
    try {
      if (_watchListBox?.get(model.id) != null) {
        log.i('model already exist - ${model.name}');
        return;
      } else {
        _watchListBox!.put(model.id, model);
        log.i('model added - ${model.name}');
      }
      // fetch selected name of the Series and grab the ID
      // Search Series on the basic of ID -  https://api.themoviedb.org/3/tv/{ID}?api_key=dotenv.env['API_KEY']
      final url =
          '${ApiConstants.searchTVSeasonsUrl}${model.id}?${ApiConstants.apiKey}';
      log.d(url);
      TvSeriesItemModel seriesDetails =
          await _apiService.fetchTvSeriesDetails(url: url);
      log.d(seriesDetails);
      // get list of Sessions
      // Search all the episode details from each Session
    } catch (e) {
      log.e(e);
    }
  }

  void removeModel(TvSeriesSearchResult model) async {
    log.i('model removed - ${model.name}');
    await _watchListBox!.delete(model.id);
  }
}
