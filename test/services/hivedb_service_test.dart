/// dart run build_runner build -d
///
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/datamodels/tv_series_search_response_model.dart';
import 'package:watch_next/services/hivedb_service.dart';

import '../helpers/test_helpers.dart';
import 'package:watch_next/contants/constansts.dart' as my_const;

import '../helpers/test_helpers.mocks.dart';

class MockBox extends Mock implements Box<TvSeriesSearchResult> {}

class MockHiveInterface extends Mock implements HiveObjectMixin {}

void main() {
  group('HivedbServiceTest -', () {
    // late HivedbService hivedbService;
    // // late MockBox mockBox;
    // late MockHiveInterface mockHive;
    // late MockHivedbService mockHivedbService;
    // late HivedbService hivedbService;
    setUpAll(() => locator.allowReassignment = true);
    setUp(() {
      //   mockHivedbService = getAndRegisterHivedbService();
      //   hivedbService = locator<HivedbService>();
      //   mockHive = MockHiveInterface();
    });
    tearDown(() => locator.reset());

    test('init should initialize Hive and open the box if not already opened',
        () async {
      // var mockStorageService = MockHiveService();
      // locator.registerSingleton<HivedbService>(mockStorageService);

      // var hivedbService = HivedbService();
      // await mockHivedbService.init();
      // verify(mockHivedbService.openBox<TvSeriesSearchResult>(Constants.watchListBox))
      //     .called(1);

      // verify(mockHive.registerAdapter(TvSeriesSearchResultAdapter())).called(1);
    });
  });
}

// void main() {
//   group('HivedbServiceTest -', () {
//     // late HivedbService hivedbService;
//     // late MockBox mockBox;
//     // late MockHiveInterface mockHive;
//     setUp(() {
//       registerServices();
//       hivedbService = HivedbService();
//       mockBox = MockBox();
//       mockHive = MockHiveInterface();
//     });
//     tearDown(() => locator.reset());

//     test('init should initialize Hive and open the box if not already opened',
//         () async {
//       // when(mockHive.isBoxOpen(my_const.Constansts.watchListBox))
//       //     .thenReturn(false);
//       when(mockHive
//               .openBox<TvSeriesSearchResult>(my_const.Constansts.watchListBox))
//           .thenAnswer((_) async => mockBox);
//       mockHive.init('path');
//       mockHive.registerAdapter(TvSeriesSearchResultAdapter());
//       await hivedbService.init();

//       verify(Hive.registerAdapter(TvSeriesSearchResultAdapter())).called(1);
//       verify(Hive.openBox<TvSeriesSearchResult>(
//               my_const.Constansts.watchListBox))
//           .called(1);
//       expect(hivedbService.getwatchListBox, mockBox);
//     });
//   });
// }
