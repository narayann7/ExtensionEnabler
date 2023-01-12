import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';

class BuildExtension extends Command {
  @override
  final name = 'build';

  @override
  final description = 'Builds the project.';

  @override
  Future<void> run() async {
    Process.start(
      'flutter',
      ["build", "web", "--web-renderer", "html", "--csp"],
      runInShell: true,
    ).then((value) {
      value.stdout.transform(utf8.decoder).listen((data) {
        print(data);
      });
    });
  }
}
