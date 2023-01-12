// ignore_for_file: constant_identifier_names

import 'package:extension_enabler/utils/logger.dart';

const isDev = "web";

/// STARTING MESSAGE FOR THE CLI
const String START_MESSAGE = '''\n
╔════════════════════════════════════════════════════╗
║             ⚡⚡  Extension Enabler  ⚡⚡          ║
╠════════════════════════════════════════════════════╣
\n''';

const String UPDATE_MESSAGE = '''\n
╔════════════════════════════════════════════════════╗
║             ⚙️⚙️ Update Extension  ⚙️⚙️            ║
╠════════════════════════════════════════════════════╣
\n
''';

//MANIFEST DEFAULT CONFIGURATION FOR CHROME EXTENSION
//ITS IS NOT CONSTANT BEACUSE WE WILL BE ADDING MORE CONFIGURATION LATER
Map<String, dynamic> MANIFEST_DEFAULT_CONFIG = {
  "name": "NAME",
  "description": "DESCRIPTION",
  "version": "1.0.0",
  "content_security_policy": {
    "extension_pages": "script-src 'self' ; object-src 'self'"
  },
  "action": {
    "default_popup": "index.html",
    "default_icon": "icons/Icon-192.png"
  },
  "manifest_version": 3
};

//SCRIPT TAG TO BE INSERTED
const String SCRIPT_TAG =
    '''<script src="main.dart.js" type="application/javascript"></script>''';

/// ENDING MESSAGE FOR THE CLI
const String END_MESSAGE = '''\n
🎉🎉🎉 Extension enabled successfully 🎉🎉🎉
💖💖💖  Happy Coding & Keep Learning  💖💖💖

''';

const String UPDATE_END_MESSAGE = '''\n
🎉🎉🎉 Extension updated successfully 🎉🎉🎉
💖💖💖  Happy Coding & Keep Learning  💖💖💖

''';

getErrorForFileNotFound() {
  Logger.error(
      "\n❌ Error: file not found, make sure there is web/index.html and web/manifest.json in your project\n");

  Logger.normal("\nenable web support in your project\n");
  Logger.normal("to know more: https://docs.flutter.dev/web\n\n");
}
