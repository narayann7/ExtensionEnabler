import 'package:args/args.dart';
import 'package:extension_enabler/helpers/extension_details_inputs.dart';
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
    // extensionDetails.getWidthFromUser();
    // = getExtensionDetails(
    //     // details: ExtensionDetails(
    //     //   name: "Test",
    //     //   description: "Test",
    //     //   version: "1.0.0",
    //     //   extensionHeight: "100",
    //     //   extensionWidth: "100",
    //     // ),
    //     );

    // Logger.normal("Extension $extensionDetails");
  }
}
