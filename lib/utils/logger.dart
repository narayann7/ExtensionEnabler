import 'dart:io';

class Logger {
  static void success(String message) {
    stdout.write('\x1B[32m  $message\x1B[0m');
  }

  static void error(String message) {
    stdout.write('\x1B[31m$message\x1B[0m');
  }

  static void info(String message) {
    stdout.write('\x1B[36m$message\x1B[0m');
  }

  static void custom(String message, {LogColor logColor = LogColor.white}) {
    final color = _getColourCodes(color: logColor);
    stdout.write('$color$message\x1B[0m');
  }

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
