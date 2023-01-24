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
      //TO ENABLE EXTENSION
      ..addCommand(EnableExtension())
      //TO UPDATE EXTENSION
      ..addCommand(UpdateExtension())
      //TO BUILD EXTENSION
      ..addCommand(BuildExtension())
      //TO SHOW TIPS
      ..addCommand(TipsForExtension());

    //TO START THE CLI
    runner.run(arguments);
  } catch (e) {
    //TO HANDLE ERROR
    Logger.error("❌ ${e.toString()}");
    exit(1);
  }
}
