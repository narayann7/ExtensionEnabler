import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:extension_enabler/commands/tips.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/commands/build.dart';
import 'package:extension_enabler/commands/enable_extension.dart';
import 'package:extension_enabler/commands/update_extension.dart';

void main(List<String> arguments) async {
  try {
    CommandRunner runner = CommandRunner("enable_extension",
        "Enable web as extension for chromium based browsers")
      ..addCommand(EnableExtension())
      ..addCommand(UpdateExtension())
      ..addCommand(BuildExtension())
      ..addCommand(TipsForExtension());
    runner.run(arguments);
  } catch (e) {
    Logger.error("❌ ${e.toString()}");
    exit(1);
  }
}
