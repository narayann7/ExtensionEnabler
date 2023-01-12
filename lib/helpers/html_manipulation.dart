import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/models/file_manipulation.dart';

void htmlManipulation({required ExtensionDetails extensionDetails}) {
  try {
    FileManipulation indexHtml = FileManipulation();

    //SETTING THE FILE PATH
    indexHtml.setFilePath(filePath: "web", fileName: "index.html");

    //GETTING THE DOCUMENT
    Document document = indexHtml.document;

    //REMOVING ALL THE SCRIPT TAG'S
    List<Element> scriptTags = document.getElementsByTagName('script');
    for (var i = 0; i < scriptTags.length; i++) {
      scriptTags[i].remove();
    }

    //GETTING THE BODY TAG
    List<Element> body = document.getElementsByTagName('body');
    //INSERTING THE SCRIPT TAG INTO THE BODY TAG
    body[0].nodes.insert(0, parseFragment(scriptTag));

    //GETTING THE HTML TAG
    List<Element> html = document.getElementsByTagName('html');
    //INSERTING THE STYLE TAG INTO THE HEAD TAG
    html[0].attributes['style'] =
        "height: ${extensionDetails.height}; width: ${extensionDetails.width};";

    //WRITING THE CHANGES TO THE FILE
    indexHtml.writeToFile(document.outerHtml);
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
