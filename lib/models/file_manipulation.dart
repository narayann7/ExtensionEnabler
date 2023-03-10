import 'dart:io';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:path/path.dart' as path;

class FileManipulation {
  String? _filePath;
  File? _file;
  Document? _document;

  //SET THE FILE PATH
  setFilePath({
    required String filePath,
    required String fileName,
  }) {
    try {
      //GET THE CURRENT DIRECTORY PATH WITH THE FILE PATH AND FILE NAME
      _filePath = path.join(Directory.current.path, filePath, fileName);
      _file = File(_filePath!);
    } catch (e) {
      rethrow;
    }
  }

  get document {
    //GET THE FILE AS A STRING
    String documentAsString = getFileAsString();
    //PARSE THE STRING TO A DOCUMENT
    _document = parse(documentAsString);
    if (_filePath == null || _filePath == "") {
      throw Exception("File path not set");
    } else {
      return _document;
    }
  }

  //GET THE FILE AS A STRING
  String getFileAsString() {
    //IF FILE PATH IS EMPTY OR NULL THROW AN EXCEPTION
    if (_filePath == null || _filePath == "") {
      throw Exception("File path not set");
    } else {
      //READ THE FILE AS A STRING
      return _file!.readAsStringSync();
    }
  }

  //WRITE TO THE FILE
  writeToFile(String content) {
    //IF FILE PATH IS EMPTY OR NULL THROW AN EXCEPTION
    if (_filePath == null || _filePath == "") {
      throw Exception("File path not set");
    } else {
      //WRITE THE CONTENT TO THE FILE
      _file!.writeAsStringSync(content);
    }
  }
}
