import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Constansts {
  static const String watchListBox = 'watch_list_box';
  static const String watchListItemDetailBox = 'watch_list_item_detail_box';
  static const String watchListItemSeasonsBox = 'watch_list_item_seasons_box';

  static const String key = 'customCacheKey';
  static final customCacheManager = CacheManager(Config(
    key,
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 200,
    repo: JsonCacheInfoRepository(databaseName: key),
  ));
}
