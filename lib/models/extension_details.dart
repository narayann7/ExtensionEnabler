import 'dart:io';
import 'package:extension_enabler/utils/logger.dart';

class ExtensionDetails {
  String name;
  String description;
  String version;
  String width;
  String height;

  ExtensionDetails({
    this.name = "app_name",
    this.description = "app_description",
    this.version = "1.0.0",
    this.width = "200px",
    this.height = "200px",
  });

  //TO GET NAME FROM USER AND CHECK IF IT IS VALID FROM CLI
  getNameFromUser() {
    Logger.info("Enter the extension name [current: '$name'] : ");
    //READING THE INPUT FROM CLI
    final String? input = stdin.readLineSync();
    if (input == "") {
      return;
    } else {
      if (input!.length > 20 || input.length < 3) {
        Logger.error(
            "❌ Name should be less than 20 characters and more than 3\n");
        //AGAIN CALLING THE FUNCTION TO GET THE NAME IF IT IS INVALID
        getNameFromUser();
      } else {
        name = input;
      }
    }
  }

  //TO GET DESCRIPTION FROM USER AND CHECK IF IT IS VALID FROM CLI
  getDescriptionFromUser() {
    Logger.info("Enter the extension description [current: '$description'] : ");
    //READING THE INPUT FROM CLI
    final String? input = stdin.readLineSync();
    if (input == "") {
      return;
    } else if (input!.length > 100 || input.length < 3) {
      Logger.error(
          "❌ Description should be less than 100 characters and more than 3\n");
      //AGAIN CALLING THE FUNCTION TO GET THE DESCRIPTION IF IT IS INVALID
      getDescriptionFromUser();
    } else {
      description = input;
    }
  }

  //TO GET HEIGHT FROM USER AND CHECK IF IT IS VALID FROM CLI
  getHeightFromUser() {
    try {
      Logger.info("Enter the extension height [current: '$height'] : ");
      //READING THE INPUT FROM CLI
      final String? input = stdin.readLineSync();
      //CHECKING IF THE INPUT IS VALID
      height = "${_checkForVaildDimension(input!)}px";
    } catch (e) {
      //CATCHING THE ERROR AND FORMATTING IT
      Logger.error("❌${e.toString().substring(
            e.toString().indexOf(":") + 1,
            e.toString().length,
          )}\n");

      //AGAIN CALLING THE FUNCTION TO GET THE HEIGHT
      getHeightFromUser();
    }
  }

  //TO GET WIDTH FROM USER AND CHECK IF IT IS VALID FROM CLI
  getWidthFromUser() {
    try {
      Logger.info("Enter the extension width [current: '$width'] : ");
      //READING THE INPUT FROM CLI
      final String? input = stdin.readLineSync();
      //CHECKING IF THE INPUT IS VALID
      width = "${_checkForVaildDimension(input!)}px";
    } catch (e) {
      //CATCHING THE ERROR AND FORMATTING IT
      Logger.error("❌${e.toString().substring(
            e.toString().indexOf(":") + 1,
            e.toString().length,
          )}\n");

      //AGAIN CALLING THE FUNCTION TO GET THE WIDTH
      getWidthFromUser();
    }
  }

  //TO GET VERSION FROM USER AND CHECK IF IT IS VALID FROM CLI
  getVersionFromUser() {
    Logger.info("Enter the extension version [current: '$version'] : ");
    //READING THE INPUT FROM CLI
    final String? input = stdin.readLineSync();
    if (input == "") {
      return;
    }
    //CHECKING IF THE INPUT IS VALID
    else if (_validateVersion(input!)) {
      version = input;
    } else {
      Logger.error("❌ Invalid version format\n");
      getVersionFromUser();
    }
  }

  //TO VALIDATE THE VERSION
  bool _validateVersion(String version) {
    //REGEX TO CHECK IF THE VERSION IS VALID
    final RegExp versionRegex = RegExp(r"^\d+\.\d+\.\d+$");
    return versionRegex.hasMatch(version.toString());
  }

  //TO CHECK IF THE DIMENSION IS VALID
  String _checkForVaildDimension(String dimension) {
    try {
      if (dimension == "") {
        //IF THE USER DOESN'T ENTER ANYTHING THEN RETURN THE DEFAULT VALUE
        return "200";
      }
      final int height = int.parse(dimension);
      //CHECKING IF THE DIMENSION IS BETWEEN 100 AND 800
      if (!(height >= 100 && height <= 800)) {
        throw Exception(
            "Please enter a valid number between 100 and 800 (inclusive)");
      }
      return dimension;
      //CATCHING THE ERROR IF THE DIMENSION IS NOT A NUMBER
    } on FormatException {
      throw Exception("Please enter a valid dimension (don't use px)");
    }
  }

  @override
  String toString() {
    return 'ExtensionDetails(name: $name, description: $description, version: $version, width: $width, height: $height)';
  }
}
