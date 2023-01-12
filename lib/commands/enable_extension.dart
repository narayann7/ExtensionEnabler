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
      Logger.normal(START_MESSAGE);

      ExtensionDetails extensionDetails = getExtensionDetails();
      htmlManipulation(extensionDetails: extensionDetails);
      manifestManipulation(extensionDetails: extensionDetails);

      Logger.normal(END_MESSAGE);

      Logger.success(
          "\n🛠️  to build the extension run: flutter pub run extension_enabler build\n\n");
    } catch (e) {
      Logger.error("❌ ${e.toString()}");
    }
  }
}
