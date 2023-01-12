import 'package:args/command_runner.dart';
import 'package:extension_enabler/utils/logger.dart';

class TipsForExtension extends Command {
  @override
  final name = 'tips';

  @override
  final description =
      'To get tips about Extension Developement . [i.e flutter pub run extension_enabler tips]';

  @override
  Future<void> run() async {
    Logger.success('\nGenneral helpful tips:\n\n');
    Logger.normal(
        '1. To run the extension on chromium based browser, go to browser_name://extensions/\n   enable Developer Mode in the browser and load the extension.\n\n');
    Logger.normal(
        '2. Every time you make changes in the code or add new features, you need to rebuild the extension.\n   To do so, run the command [flutter pub run extension_enabler build]\n\n');
    Logger.normal(
        "3. If flutter web is not enabled, run the command [flutter config --enable-web]\n   to know more visit : https://docs.flutter.dev/get-started/web\n\n");
    Logger.normal(
        "4. Whenever updating the extenion with [flutter pub run extension_enabler update]\n   you have remove the extension form browser_name://extensions/ and load it again  \n\n");
    Logger.normal(
        "5. If you are facing any issues, feel free to open an issue on github:\n   https://github.com/narayann7/ExtensionEnabler\n");
  }
}
