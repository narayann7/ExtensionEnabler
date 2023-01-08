// ignore_for_file: constant_identifier_names
/// Starting message for the CLI
const String START_MESSAGE = '''\n
╔════════════════════════════════════════════════════╗
║             ⚡⚡  Extension Enabler  ⚡⚡          ║
╠════════════════════════════════════════════════════╣
\n''';

//MANIFEST DEFAULT CONFIGURATION FOR CHROME EXTENSION
const Map<String, dynamic> MANIFEST_DEFAULT_CONFIG = {
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
