import 'dart:io';

import 'package:args/args.dart';

void mainx(List<String> arguments) async {
  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {
    // stdout.write("hello");
    var myFile = File('file.txt');
    myFile.writeAsStringSync('Hello World');
    await myFile.create(recursive: true);
    // var result =
    //     await Process.run('powershell.exe', ['-command', "dart --version"]);
    // stdout.write(result.stdout);

  }
}
