import 'dart:convert';
import 'dart:io';

import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/models/file_manipulation.dart';

//TO MANIPULATE THE MANIFEST FILE
void manifestManipulation({required ExtensionDetails extensionDetails}) {
  try {
    FileManipulation manifestJson = FileManipulation();

    //SETTING THE FILE PATH
    manifestJson.setFilePath(filePath: "web", fileName: "manifest.json");

    //COPYING THE CONSTANTS MANIFEST CONFIG TO A NEW MAP
    //SO THAT WE CAN CHANGE THE VALUES ACCORDING TO THE USER INPUT
    Map<String, dynamic> manifestConfig = manifestDefaultConfig;
    manifestConfig['name'] = extensionDetails.name;
    manifestConfig['description'] = extensionDetails.description;
    manifestConfig['version'] = extensionDetails.version;

    //CONVERTING THE MANIFEST_DEFAULT_CONFIG TO STRING WITH INDENTATION
    String configManifest =
        JsonEncoder.withIndent('  ').convert(manifestDefaultConfig);

    //REPLACE THE MANIFEST FILE WITH THE NEW CONFIG
    manifestJson.writeToFile(configManifest);
  } on FileSystemException catch (e) {
    //IF THE FILE IS NOT FOUND
    getErrorForFileNotFound();
    Logger.error("❌ ${e.toString()}");
    exit(1);
  } catch (e) {
    Logger.error("❌ ${e.toString()}");
  }
}
