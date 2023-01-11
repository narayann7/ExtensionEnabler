import 'package:args/command_runner.dart';
import 'package:extension_enabler/commands/enable_extension.dart';
import 'package:extension_enabler/commands/update_extension.dart';
import 'package:extension_enabler/utils/logger.dart';

void main(List<String> arguments) async {
  try {
    CommandRunner runner =
        CommandRunner("enable_extension", "Enable an extension")
          ..addCommand(EnableExtension())
          ..addCommand(UpdateExtension());
    runner.run(arguments);
  } catch (e) {
    Logger.error("❌${e.toString()}");
  }
}
