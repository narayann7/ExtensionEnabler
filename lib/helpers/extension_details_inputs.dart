import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/models/extension_details.dart';

//GET EXTENSION DETAILS FROM USER
//THE CAUSE OF details AS OPTIONAL IS TO USE IN TWO CASES
//1. WHEN USER IS CREATING A NEW EXTENSION
//2. WHEN USER IS UPDATING AN EXISTING EXTENSION
ExtensionDetails getExtensionDetails({ExtensionDetails? details}) {
  //IF DETAILS IS NULL CREATE A NEW EXTENSION DETAILS OBJECT
  ExtensionDetails extensionDetails = details ?? ExtensionDetails();

  Logger.normal("🌱 Enter the extension details: \n");
  Logger.normal("ℹ️ Press enter to keep the current value\n\n");
  //GET THE EXTENSION NAME FROM THE USER
  extensionDetails.getNameFromUser();
  //GET THE EXTENSION DESCRIPTION FROM THE USER
  extensionDetails.getDescriptionFromUser();
  //GET THE EXTENSION VERSION FROM THE USER
  extensionDetails.getVersionFromUser();
  //GET THE EXTENSION HEIGHT FROM THE USER
  extensionDetails.getHeightFromUser();
  //GET THE EXTENSION WIDTH FROM THE USER
  extensionDetails.getWidthFromUser();

  return extensionDetails;
}
