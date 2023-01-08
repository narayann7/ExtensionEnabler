import 'package:args/args.dart';

void mainx(List<String> arguments) async {
  // stdout.write(START_MESSAGE);
  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {}
}
