import 'dart:io';

class Read {
  static String readString({String? message}) {
    if (message != null) {
      print(message);
    }
    String value = stdin.readLineSync() ?? "";
    return value;
  }

  static double readDouble({String? message}) {
    if (message != null) {
      print(message);
    }
    String value = stdin.readLineSync() ?? "0";
    double number = double.tryParse(value) ?? 0;
    return number;
  }

  static int readInt({String? message}) {
    if (message != null) {
      print(message);
    }
    String value = stdin.readLineSync() ?? "0";
    int number = int.tryParse(value) ?? 0;
    return number;
  }
}
