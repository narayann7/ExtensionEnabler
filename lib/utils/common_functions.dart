import 'dart:io';

void loadingLog() {
  String loading =
      "[--------------------------------------------------------------------------------------------------------------]";
  for (int i = 2; i < 101; i++) {
    loading = loading.replaceRange(i - 1, i, "»");
    stdout.write("$loading $i%");
    sleep(Duration(milliseconds: 20));

    // stdout.write("\n");
    stdout.write('\r\x1B[K');
  }
}
