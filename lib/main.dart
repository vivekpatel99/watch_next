import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:watch_next/app/app.bottomsheets.dart';
import 'package:watch_next/app/app.dialogs.dart';
import 'package:watch_next/app/app.locator.dart';
import 'package:watch_next/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:watch_next/common/mylogger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  Logger.level = Level.all;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final log = getLogger('MainApp');
    log.i('MainApp started');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.searchView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
