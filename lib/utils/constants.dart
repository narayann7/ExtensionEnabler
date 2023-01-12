import 'package:extension_enabler/utils/logger.dart';

/// STARTING MESSAGE FOR THE CLI
const String startMessage = '''\n
╔════════════════════════════════════════════════════╗
║             ⚡⚡  Extension Enabler  ⚡⚡          ║
╠════════════════════════════════════════════════════╣
\n''';

const String updateMessage = '''\n
╔════════════════════════════════════════════════════╗
║             ⚙️⚙️ Update Extension  ⚙️⚙️            ║
╠════════════════════════════════════════════════════╣
\n
''';

//MANIFEST DEFAULT CONFIGURATION FOR CHROME EXTENSION
//ITS IS NOT CONSTANT BEACUSE WE WILL BE ADDING MORE CONFIGURATION LATER
Map<String, dynamic> manifestDefaultConfig = {
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
const String scriptTag =
    '''<script src="main.dart.js" type="application/javascript"></script>''';

/// ENDING MESSAGE FOR THE CLI
const String endMessage = '''\n
Extension enabled successfully 🎉
Happy Coding & Keep Learning   💖

''';

const String updateEndMessage = '''\n
Extension updated successfully 🎉
Happy Coding & Keep Learning   💖

''';

getErrorForFileNotFound() {
  Logger.error(
      "\n❌ Error: file not found, make sure there is web/index.html and web/manifest.json in your project\n");

  Logger.normal("\nenable web support in your project\n");
  Logger.normal("to know more: https://docs.flutter.dev/web\n\n");
}
