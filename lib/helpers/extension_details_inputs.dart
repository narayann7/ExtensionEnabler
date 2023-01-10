import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/logger.dart';

ExtensionDetails getExtensionDetails({ExtensionDetails? details}) {
  ExtensionDetails extensionDetails = details ?? ExtensionDetails();

  Logger.normal("🌱 Enter the extension details: \n");
  Logger.normal("ℹ️ Press enter to keep the current value\n\n");

  extensionDetails.getNameFromUser();
  extensionDetails.getDescriptionFromUser();
  extensionDetails.getVersionFromUser();
  extensionDetails.getWidthFromUser();
  extensionDetails.getHeightFromUser();

  return extensionDetails;
}
