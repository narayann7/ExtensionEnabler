import 'package:args/args.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/utils/logger.dart';

void mainx(List<String> arguments) async {
  Logger.custom(START_MESSAGE, logColor: LogColor.cyan);

  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {
    // ExtensionDetails extensionDetails = ExtensionDetails();

    Logger.custom("Enabling extension", logColor: LogColor.green);
  }
}
