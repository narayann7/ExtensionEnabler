import 'dart:io';
import 'package:html/parser.dart';
import 'package:path/path.dart' as path;
import 'package:args/args.dart';

void mainx(List<String> arguments) async {
  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {
    // stdout.write("hello");
    // var myFile = File('file.txt');
    // myFile.writeAsStringSync('Hello World');
    // await myFile.create(recursive: true);
    // var result =
    //     await Process.run('powershell.exe', ['-command', "dart --version"]);
    // stdout.write(result.stdout);
    var filePath = path.join(Directory.current.path, "web", 'index.html');
    File file = File(filePath);
    var fileContent = file.readAsStringSync();

    var document = parse(fileContent);
    // var script = document.querySelector('script');
    // script!.attributes['src'] = 'main.dart.js';

    // var str = document.getElementsByTagName('script')[0].outerHtml;

    document.getElementsByTagName('head')[0].attributes['height'] = "100px";
    stdout.write(document.toString());

    file.writeAsStringSync(document.outerHtml);
    fileContent = file.readAsStringSync();
    stdout.write(fileContent);
  }
}
