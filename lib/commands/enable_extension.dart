import 'package:args/command_runner.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';
import 'package:extension_enabler/helpers/manifest_manipulation.dart';
import 'package:extension_enabler/helpers/extension_details_inputs.dart';

class EnableExtension extends Command {
  @override
  final name = "enable";

  @override
  final description =
      "Enable an extension. [i.e flutter pub run extension_enabler enable]";

  @override
  run() {
    try {
      Logger.normal(startMessage);
      //GET THE EXTENSION DETAILS FROM THE USER.
      ExtensionDetails extensionDetails = getExtensionDetails();
      //MANIPULATE THE HTML FILE.
      htmlManipulation(extensionDetails: extensionDetails);
      //MANIPULATE THE MANIFEST FILE.
      manifestManipulation(extensionDetails: extensionDetails);

      Logger.normal(endMessage);

      Logger.success(
          "\n🛠️  to build the extension run: flutter pub run extension_enabler build\n\n");
    } catch (e) {
      Logger.error("❌ ${e.toString()}");
    }
  }
}
