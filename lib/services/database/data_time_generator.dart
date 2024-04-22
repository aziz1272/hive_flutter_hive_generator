String createdTime() {
  return "${DateTime.now()}";
}

String dateTime(String time) {
  /// 5:37 | 2022.02.09

  String result = "";
  String min = "";
  String mon = "";
  String day = "";

  DateTime dateTime = DateTime.parse(time);

  if (dateTime.minute < 10) {
    min = "0${dateTime.minute}";
  } else {
    min = "${dateTime.minute}";
  }

  if (dateTime.month < 10) {
    mon = "0${dateTime.month}";
  } else {
    mon = "${dateTime.month}";
  }
  if (dateTime.day < 10) {
    day = "0${dateTime.day}";
  } else {
    day = "${dateTime.day}";
  }
  result = "${dateTime.hour}:$min | ${dateTime.year}.$mon.$day";

  return result;
}