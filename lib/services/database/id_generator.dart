import 'dart:math';

String idGenerator() {
  String id = "";
  String symbols =
      "qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM";

  for (int i = 0; i < 8; i++) {
    Random random = Random();
    id += symbols[random.nextInt(symbols.length)];
  }

  return id;
}