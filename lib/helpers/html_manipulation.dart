import 'dart:io';

import 'package:extension_enabler/models/extension_details.dart';
import 'package:extension_enabler/utils/constants.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:path/path.dart' as path;

void htmlManipulation({required ExtensionDetails extensionDetails}) {
  try {
    //GETTING THE FILE PATH
    String indexHtmlPath =
        path.join(Directory.current.path, "testing", 'index.html');

    //READING THE FILE FROM THE PATH
    File indexHtmlFile = File(indexHtmlPath);

    //READING THE FILE CONTENT AS STRING
    String documentAsString = indexHtmlFile.readAsStringSync();

    //PARSING THE STRING TO HTML DOCUMENT
    Document document = parse(documentAsString);

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
    indexHtmlFile.writeAsStringSync(document.outerHtml);
  } on FileSystemException {
    stdout.write("file not found");
  } catch (e) {
    stdout.write("Error: $e");
  }
}

setDimensions() {}
// <html style="height: 500px; width: 600px">

