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
    _filePath = path.join(Directory.current.path, filePath, fileName);
    _file = File(_filePath!);
  }

  get document {
    String documentAsString = getFileAsString();
    _document = parse(documentAsString);
    if (_filePath == null || _filePath == "") {
      throw Exception("File path not set");
    } else {
      return _document;
    }
  }

  getFileAsString() {
    if (_filePath == null || _filePath == "") {
      throw Exception("File path not set");
    } else {
      return _file!.readAsStringSync();
    }
  }

  writeToFile(String content) {
    if (_filePath == null || _filePath == "") {
      throw Exception("File path not set");
    } else {
      return _file!.writeAsStringSync(content);
    }
  }
}
