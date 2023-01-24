import 'dart:io';

//LOGGER CLASS
class Logger {
  //SUCCESS MESSAGE
  static void success(String message) {
    //SET THE COLOR TO GREEN
    stdout.write('\x1B[32m$message\x1B[0m');
  }

  //ERROR MESSAGE
  static void error(String message) {
    //SET THE COLOR TO RED
    stdout.write('\x1B[31m$message\x1B[0m');
  }

  //INFO MESSAGE
  static void info(String message) {
    //SET THE COLOR TO BLUE
    stdout.write('\x1B[36m$message\x1B[0m');
  }

  //NORMAL MESSAGE
  static void normal(String message) {
    //SET THE COLOR TO WHITE
    stdout.write('\x1B[37m$message\x1B[0m');
  }

  //CUSTOM MESSAGE
  static void custom(String message, {LogColor logColor = LogColor.white}) {
    final color = _getColourCodes(color: logColor);
    //SET THE COLOR TO CUSTOM
    stdout.write('$color$message\x1B[0m');
  }

  //GET THE COLOR CODES
  static _getColourCodes({
    required LogColor color,
  }) {
    switch (color) {
      case LogColor.reset:
        return '\x1B[0m';
      case LogColor.black:
        return '\x1B[30m';
      case LogColor.white:
        return '\x1B[37m';
      case LogColor.red:
        return '\x1B[31m';
      case LogColor.green:
        return '\x1B[32m';
      case LogColor.yellow:
        return '\x1B[33m';
      case LogColor.blue:
        return '\x1B[34m';
      case LogColor.cyan:
        return '\x1B[36m';
    }
  }
}

//ENUM FOR COLORS
enum LogColor {
  reset,
  black,
  white,
  red,
  green,
  yellow,
  blue,
  cyan,
}

// Reset:   \x1B[0m
// Black:   \x1B[30m
// White:   \x1B[37m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Cyan:    \x1B[36m

//more about color code
//https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
