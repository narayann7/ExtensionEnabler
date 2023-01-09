import 'dart:io';

import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/logger.dart';

ExtensionDetails getExtensionDetails({ExtensionDetails? details}) {
  ExtensionDetails extensionDetails = details ?? ExtensionDetails();

  Logger.normal("🌱 Enter the extension details: \n");
  Logger.normal("ℹ️ Press enter to keep the current value\n\n");

  Logger.info(
      "Enter the extension name [current: '${extensionDetails.name}'] : ");
  extensionDetails.name = stdin.readLineSync()!;
  Logger.info(
      "Enter the extension description [current: '${extensionDetails.description}'] : ");
  extensionDetails.description = stdin.readLineSync()!;
  Logger.info(
      "Enter the extension version [current: '${extensionDetails.version}'] : ");
  extensionDetails.version = stdin.readLineSync()!;
  Logger.info(
      "Enter the extension height [current: '${extensionDetails.extensionHeight}'] : ");
  extensionDetails.extensionHeight = stdin.readLineSync()!;
  Logger.info(
      "Enter the extension width [current: '${extensionDetails.extensionWidth}'] : ");
  extensionDetails.extensionWidth = stdin.readLineSync()!;
  return extensionDetails;
}
