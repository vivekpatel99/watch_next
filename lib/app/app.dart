import 'package:watch_next/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:watch_next/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:watch_next/ui/views/home/home_view.dart';
import 'package:watch_next/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/services/api_service.dart';
import 'package:watch_next/ui/views/search/search_view.dart';

import 'package:watch_next/services/searchquery_service.dart';
import 'package:watch_next/services/hivedb_service.dart';
import 'package:watch_next/services/my_snackbar_service.dart';
import 'package:watch_next/ui/views/upcoming/upcoming_view.dart';
import 'package:watch_next/ui/views/recent/recent_view.dart';
import 'package:watch_next/ui/dialogs/on_tap_overview/on_tap_overview_dialog.dart';
import 'package:watch_next/ui/dialogs/on_tap_overview/on_tap_overview_dialog.dart';
import 'package:watch_next/ui/dialogs/on_tap_overview/on_tap_overview_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SearchView),

    MaterialRoute(page: TabUpcomingView),
    MaterialRoute(page: TabRecentView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: SearchqueryService),
    LazySingleton(classType: HivedbService),
    LazySingleton(classType: MySnackbarService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: OnTapOverviewDialog),
    StackedDialog(classType: OnTapOverviewDialog),
    StackedDialog(classType: OnTapOverviewDialog),
// @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
