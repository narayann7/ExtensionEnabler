import 'package:args/command_runner.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/helpers/extract_data.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';
import 'package:extension_enabler/helpers/manifest_manipulation.dart';
import 'package:extension_enabler/helpers/extension_details_inputs.dart';

class UpdateExtension extends Command {
  @override
  final name = "update";
  @override
  final description =
      "Update an extension. [i.e flutter pub run extension_enabler update]";
  @override
  void run() {
    try {
      Logger.normal(UPDATE_MESSAGE);

      ExtensionDetails extensionDetails = getExtractedData();
      extensionDetails = getExtensionDetails(details: extensionDetails);
      htmlManipulation(extensionDetails: extensionDetails);
      manifestManipulation(extensionDetails: extensionDetails);

      Logger.normal(UPDATE_END_MESSAGE);

      Logger.success(
          "\n🛠️  to build the extension run: flutter pub run extension_enabler build\n");
    } catch (e) {
      Logger.error("❌ ${e.toString()}");
    }

    //todo
    // bool isIcon = argResults!.arguments.toList().contains("--icon");
  }
}
