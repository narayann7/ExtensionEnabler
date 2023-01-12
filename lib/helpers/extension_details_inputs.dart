import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/models/extension_details.dart';

//GET EXTENSION DETAILS FROM USER
//THE CAUSE OF details AS OPTIONAL IS TO USE IN TWO CASES
//1. WHEN USER IS CREATING A NEW EXTENSION
//2. WHEN USER IS UPDATING AN EXISTING EXTENSION
ExtensionDetails getExtensionDetails({ExtensionDetails? details}) {
  ExtensionDetails extensionDetails = details ?? ExtensionDetails();

  Logger.normal("🌱 Enter the extension details: \n");
  Logger.normal("ℹ️ Press enter to keep the current value\n\n");

  extensionDetails.getNameFromUser();
  extensionDetails.getDescriptionFromUser();
  extensionDetails.getVersionFromUser();
  extensionDetails.getHeightFromUser();
  extensionDetails.getWidthFromUser();

  return extensionDetails;
}
