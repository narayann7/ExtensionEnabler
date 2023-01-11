import 'package:args/command_runner.dart';
import 'package:extension_enabler/helpers/extension_details_inputs.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';
import 'package:extension_enabler/helpers/manifest_manipulation.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/utils/logger.dart';

class EnableExtension extends Command {
  @override
  final name = "enable";

  @override
  final description = "Enable an extension";

  @override
  run() {
    Logger.normal(START_MESSAGE);

    ExtensionDetails extensionDetails = getExtensionDetails();
    htmlManipulation(extensionDetails: extensionDetails);
    manifestManipulation(extensionDetails: extensionDetails);

    Logger.normal(END_MESSAGE);
  }
}
