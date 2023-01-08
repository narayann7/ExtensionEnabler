import 'dart:convert';
import 'dart:io';

import 'package:extension_enabler/utils/constants.dart';
import 'package:path/path.dart' as path;

manifestManipulation() {
  //GETTING THE MANIFEST FILE PATH
  String manifestPath =
      path.join(Directory.current.path, "testing", 'test.json');

  //OPENING THE MANIFEST FILE
  File manifestJsonFile = File(manifestPath);

  //CONVERTING THE MANIFEST_DEFAULT_CONFIG TO STRING WITH INDENTATION
  String configManifest =
      JsonEncoder.withIndent('  ').convert(MANIFEST_DEFAULT_CONFIG);

  //REPLACE THE MANIFEST FILE WITH THE NEW CONFIG
  manifestJsonFile.writeAsStringSync(configManifest);
}
