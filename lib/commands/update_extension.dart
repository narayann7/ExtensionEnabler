import 'package:args/command_runner.dart';
import 'package:extension_enabler/helpers/extension_details_inputs.dart';
import 'package:extension_enabler/helpers/extract_data.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';
import 'package:extension_enabler/helpers/manifest_manipulation.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/utils/logger.dart';

class UpdateExtension extends Command {
  @override
  final name = "update";
  @override
  final description = "Update an extension";
  @override
  void run() {
    Logger.normal(UPDATE_MESSAGE);

    ExtensionDetails extensionDetails = getExtractedData();
    extensionDetails = getExtensionDetails(details: extensionDetails);
    htmlManipulation(extensionDetails: extensionDetails);
    manifestManipulation(extensionDetails: extensionDetails);

    Logger.normal(UPDATE_END_MESSAGE);
  }
}
