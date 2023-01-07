import 'package:args/args.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';

void mainx(List<String> arguments) async {
  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {
    await htmlManipulation();
  }
}
