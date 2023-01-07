import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:path/path.dart' as path;

Future<void> htmlManipulation() async {
  try {
    //GETTING THE FILE PATH
    String indexHtmlPath =
        path.join(Directory.current.path, "web", 'index2.html');

    //READING THE FILE FROM THE PATH
    File indexHtml = File(indexHtmlPath);

    //READING THE FILE CONTENT AS STRING
    String documentAsString = indexHtml.readAsStringSync();

    //PARSING THE STRING TO HTML DOCUMENT
    Document document = parse(documentAsString);

    //REMOVING ALL THE SCRIPT TAG'S
    List<Element> scriptTags = document.getElementsByTagName('script');
    for (var i = 0; i < scriptTags.length; i++) {
      scriptTags[i].remove();
    }

    //SCRIPT TAG TO BE INSERTED
    String insertScript =
        '''<script src="main.dart.js" type="application/javascript"></script>''';

    //GETTING THE BODY TAG
    List<Element> body = document.getElementsByTagName('body');
    //INSERTING THE SCRIPT TAG INTO THE BODY TAG
    body[0].nodes.insert(0, parseFragment(insertScript));

    //WRITING THE CHANGES TO THE FILE
    indexHtml.writeAsStringSync(document.outerHtml);
  } catch (e) {
    stdout.write(e);
  }
}
