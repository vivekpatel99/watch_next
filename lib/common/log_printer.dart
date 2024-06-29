// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Reference - https://www.filledstacks.com/snippet/a-guide-to-setting-up-better-logging-in-flutter/

import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  final String className;
  SimpleLogPrinter({
    required this.className,
  });

  @override
  List<String> log(LogEvent event) {
    var emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    var color = PrettyPrinter.defaultLevelColors[event.level]!;

    return [color('$emoji $className - ${event.message}')];
  }
}
