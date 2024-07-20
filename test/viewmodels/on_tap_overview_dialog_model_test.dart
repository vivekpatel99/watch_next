import 'package:flutter_test/flutter_test.dart';
import 'package:watch_next/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('OnTapOverviewDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
