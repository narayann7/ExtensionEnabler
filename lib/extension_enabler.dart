import 'package:args/args.dart';
import 'package:extension_enabler/helpers/extension_details_inputs.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';
import 'package:extension_enabler/helpers/manifest_manipulation.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';

void mainx(List<String> arguments) async {
  Logger.normal(START_MESSAGE);

  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {
    ExtensionDetails extensionDetails = getExtensionDetails();
    htmlManipulation(extensionDetails: extensionDetails);
    manifestManipulation(extensionDetails: extensionDetails);
  }
  // parcer.addFlag("enable");
  // final results = parcer.parse(arguments);
  // if (results["enable"] == true) {
  //   ExtensionDetails extensionDetails = getExtensionDetails();
  //   htmlManipulation(extensionDetails: extensionDetails);
  //   manifestManipulation(extensionDetails: extensionDetails);
  // }
}
