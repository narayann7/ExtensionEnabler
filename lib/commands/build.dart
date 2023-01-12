import 'dart:io';
import 'dart:convert';

import 'package:args/command_runner.dart';
import 'package:extension_enabler/utils/logger.dart';

class BuildExtension extends Command {
  @override
  final name = 'build';

  @override
  final description =
      'Builds the project. [i.e flutter pub run extension_enabler build]';

  @override
  Future<void> run() async {
    Logger.success(
        'When making changes to the extension, run this command to rebuild the project.\n');
    Process.start(
      'flutter',
      ["build", "web", "--web-renderer", "html", "--csp"],
      runInShell: true,
    ).then((value) {
      value.stdout.transform(utf8.decoder).listen((data) {
        Logger.normal(data);
      });
    });
  }
}
