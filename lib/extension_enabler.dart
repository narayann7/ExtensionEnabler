import 'dart:io';

import 'package:args/args.dart';
import 'package:extension_enabler/helpers/html_manipulation.dart';
import 'package:extension_enabler/helpers/manifest_manipulation.dart';
import 'package:extension_enabler/utils/constants.dart';

void mainx(List<String> arguments) async {
  stdout.write(START_MESSAGE);
  final parcer = ArgParser();

  parcer.addFlag("enable");
  final results = parcer.parse(arguments);
  if (results["enable"] == true) {
    htmlManipulation();
    manifestManipulation();
  }
}
