import 'package:args/args.dart';
import 'package:extension_enabler/helpers/extract_data.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';

void main(List<String> arguments) async {
  Logger.normal(START_MESSAGE);

  final parcer = ArgParser();

  parcer.addFlag("update", abbr: "u");

  final results = parcer.parse(arguments);
  if (results["update"] == true) {
    updateExtension();
    // ExtensionDetails extensionDetails = getExtensionDetails();
    // htmlManipulation(extensionDetails: extensionDetails);
    // manifestManipulation(extensionDetails: extensionDetails);
  }
  // parcer.addFlag("enable");
  // final results = parcer.parse(arguments);
  // if (results["enable"] == true) {
  //   ExtensionDetails extensionDetails = getExtensionDetails();
  //   htmlManipulation(extensionDetails: extensionDetails);
  //   manifestManipulation(extensionDetails: extensionDetails);
  // }
}
