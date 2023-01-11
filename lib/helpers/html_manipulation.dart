import 'dart:io';

import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/models/file_manipulation.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:extension_enabler/utils/logger.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

void htmlManipulation({required ExtensionDetails extensionDetails}) {
  try {
    FileManipulation indexHtml = FileManipulation();

    //SETTING THE FILE PATH
    indexHtml.setFilePath(filePath: "testing", fileName: "index.html");

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
    body[0].nodes.insert(0, parseFragment(SCRIPT_TAG));

    //GETTING THE HEAD TAG
    List<Element> head = document.getElementsByTagName('head');
    //INSERTING THE STYLE TAG INTO THE HEAD TAG
    head[0].attributes['style'] =
        "height: ${extensionDetails.height}; width: ${extensionDetails.width}";

    //WRITING THE CHANGES TO THE FILE
    indexHtml.writeToFile(document.outerHtml);
  } on FileSystemException {
    stdout.write("file not found");
  } catch (e) {
    Logger.error("❌${e.toString()}");
  }
}
