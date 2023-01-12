import 'dart:io';
import 'dart:convert';

import 'package:html/dom.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/models/file_manipulation.dart';
import 'package:extension_enabler/models/extension_details.dart';

ExtensionDetails getExtractedData() {
  //TEMP FILE TO GET THE DATA FROM THE FILE
  FileManipulation tempFile = FileManipulation();
  ExtensionDetails extensionDetails = ExtensionDetails();

  try {
    //SET THE FILE PATH FOR MANIFEST.JSON
    tempFile.setFilePath(filePath: "web", fileName: "manifest.json");
    //CONVERT THE JSON FILE TO A MAP
    Map<String, dynamic> manifest = jsonDecode(tempFile.getFileAsString());

    //GET THE DATA FROM THE MAP
    extensionDetails.name = manifest["name"];
    extensionDetails.version = manifest["version"];
    extensionDetails.description = manifest["description"];

    //SET THE FILE PATH FOR INDEX.HTML
    tempFile.setFilePath(filePath: "web", fileName: "index.html");
    //GET THE HTML FILE AS A DOCUMENT
    Document document = tempFile.document;
    //FIND THE HEAD TAG
    List<Element> html = document.getElementsByTagName("html");
    //GET THE STYLE ATTRIBUTE
    String style = html[0].attributes["style"]!;

    //IN EXAMPLE
    //style="height: 456px; width: 234px;"

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
  } on FileSystemException catch (e) {
    //IF THE FILE IS NOT FOUND
    getErrorForFileNotFound();
    Logger.error("❌ ${e.toString()}");
    exit(1);
  } catch (e) {
    Logger.error("❌ ${e.toString()}");
    exit(1);
  }
}
