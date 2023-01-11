import 'dart:convert';
import 'dart:io';

import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/models/file_manipulation.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:html/dom.dart';

ExtensionDetails updateExtension() {
  //EXTRACT DATA
  FileManipulation tempFile = FileManipulation();
  ExtensionDetails extensionDetails = ExtensionDetails();

  try {
    tempFile.setFilePath(filePath: "testing", fileName: "manifest.json");

    Map<String, dynamic> manifest = jsonDecode(tempFile.getFileAsString());
    extensionDetails.name = manifest["name"];
    extensionDetails.version = manifest["version"];
    extensionDetails.description = manifest["description"];

    tempFile.setFilePath(filePath: "testing", fileName: "index.html");
    Document document = tempFile.document;
    List<Element> head = document.getElementsByTagName("head");

    String style = head[0].attributes["style"]!;
    print(style);

    //GET CURRENT HEIGHT
    extensionDetails.height = style.substring(
      style.indexOf("height: ") + 8,
      style.indexOf("px"),
    );
    //GET CURRENT WIDTH
    extensionDetails.width = style.substring(
      style.indexOf("width: ") + 7,
      style.lastIndexOf("px"),
    );
    return extensionDetails;
  } catch (e) {
    Logger.error("❌${e.toString()}");
    exit(0);
  }
}
