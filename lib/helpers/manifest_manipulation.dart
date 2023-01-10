import 'dart:convert';
import 'dart:io';

import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:path/path.dart' as path;

manifestManipulation({required ExtensionDetails extensionDetails}) {
  //GETTING THE MANIFEST FILE PATH
  String manifestPath =
      path.join(Directory.current.path, "testing", 'manifest.json');

  //OPENING THE MANIFEST FILE
  File manifestJsonFile = File(manifestPath);

  //COPYING THE CONSTANTS MANIFEST CONFIG TO A NEW MAP
  //SO THAT WE CAN CHANGE THE VALUES ACCORDING TO THE USER INPUT
  Map<String, dynamic> manifestConfig = MANIFEST_DEFAULT_CONFIG;
  manifestConfig['name'] = extensionDetails.name;
  manifestConfig['description'] = extensionDetails.description;
  manifestConfig['version'] = extensionDetails.version;

  //CONVERTING THE MANIFEST_DEFAULT_CONFIG TO STRING WITH INDENTATION
  String configManifest =
      JsonEncoder.withIndent('  ').convert(MANIFEST_DEFAULT_CONFIG);

  //REPLACE THE MANIFEST FILE WITH THE NEW CONFIG
  manifestJsonFile.writeAsStringSync(configManifest);
}
