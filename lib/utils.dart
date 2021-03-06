import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static String readTimestamp(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = new DateFormat("MM/dd/yyyy hh:mm a");
    return format.format(date);
  }

  static String getSocialReadableDateTime(String dateTime) {
    print('DateTimne Subnstring====>$dateTime');

    var now = new DateTime.now();
    Duration timezoneOffset = now.timeZoneOffset;
    print('offset is == $timezoneOffset');
    DateTime convertedDateTime = getDateTimeFromServerTime(dateTime);
    convertedDateTime = convertedDateTime.add(timezoneOffset);
//    return readTime(convertedDateTime.millisecondsSinceEpoch);
    return DateFormat('dd/MM/yy  hh:mm a').format(convertedDateTime);
  }

  static DateTime getDateTimeFromServerTime(String dateTime) {
    print('DateTimne Subnstring====>$dateTime');

    dateTime = dateTime.substring(4, dateTime.length);
//    Fri Jul 17 2020 10:17:26
//    DDD MMM dd yyyy hh:mm:ss
    print('DateTimne Subnstring====>$dateTime');
    return new DateFormat("MMM dd yyyy hh:mm:ss").parse(dateTime);
//
  }

  static String getMonthDate(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = new DateFormat("MMMM d");
    return format.format(date);
  }

  static String getyearMonthDate(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = new DateFormat("yyyy-MM-dd");
    return format.format(date);
  }

  static String getDateMonth(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = new DateFormat("d MMMM yyyy");
    return format.format(date);
  }

  static String getYear(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = new DateFormat("yyyy");
    return format.format(date);
  }

  static String getFormatDateTimeFromStringFormat(String dateTime) {
    DateTime newDateTime =
        new DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    return readTimestamp(newDateTime.millisecondsSinceEpoch);
  }

  static String getFormatDateFromStringFormat(String dateTime) {
    DateTime newDateTime = new DateFormat("yyyy-MM-dd").parse(dateTime);
    return readTimestamp(newDateTime.millisecondsSinceEpoch).substring(0, 10);
  }

  static String getFormatDate(String dateTime) {
    try {
      DateTime newDateTime = new DateFormat("MM/dd/yyyy").parse(dateTime);
      return getyearMonthDate(newDateTime.millisecondsSinceEpoch);
    } catch (e) {
      print(e);
    }
    return null;
  }

  static String getMonthDateString(String dateTime) {
    DateTime newDateTime =
        new DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    return getMonthDate(newDateTime.millisecondsSinceEpoch);
  }

  static String getDateMonthString(String dateTime) {
    DateTime newDateTime = new DateFormat("yyyy-MM-dd").parse(dateTime);
    return getDateMonth(newDateTime.millisecondsSinceEpoch);
  }

  static String getYearString(String dateTime) {
    DateTime newDateTime =
        new DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
    return getYear(newDateTime.millisecondsSinceEpoch);
  }

  static String getDateinMonthFormat(String dateTime) {
    DateTime newDateTime = new DateFormat("yyyy-MM-dd ").parse(dateTime);
    return newDateTime.toString();
  }

  static String dateDiff(String date) {
    var now = new DateTime.now();
    DateTime newDateTime = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
//    print(now.millisecondsSinceEpoch-newDateTime.millisecondsSinceEpoch);
    int daydiff = now.difference(newDateTime).inDays;
    if (daydiff >= 7) {
      int week = ((daydiff) / 7).round();
      if (week >= 1) {
        return ((daydiff) / 7).round().toString() + " " + "weeks ago";
      } else {
        return ((daydiff) / 7).round().toString() + " " + "week ago";
      }
    } else {
      if (daydiff <= 1) {
        if (daydiff == 1)
          return "$daydiff day ago";
        else
          return "Today";
      } else {
        return "$daydiff days ago";
      }
    }
  }

  static String readTime(int timestamp) {
    print(timestamp);
    var timeString = '';
    timestamp = timestamp *
        1000; // Conversion in Seconds from Milliseconds as per API Response

    if (timestamp >= 1000) {
      int seconds = ((timestamp / 1000) % 60)
          .round(); // Conversion in Seconds from Milliseconds
      int minutes = ((timestamp / (1000 * 60)) % 60)
          .round(); // Conversion in Minutes from Milliseconds
      int hours = ((timestamp / (1000 * 60 * 60)) % 24)
          .round(); // Conversion in Hours from Milliseconds

      print('Hours: ' +
          hours.toString() +
          ' Minutes: ' +
          minutes.toString() +
          ' Seconds: ' +
          seconds.toString());

      if (seconds > 0 && minutes == 0) {
        timeString = '0:' + seconds.toString() + ' min';
      } else if (seconds == 0 && minutes > 0) {
        timeString = minutes.toString() + ':0 min';
      } else if (seconds > 0 && minutes > 0) {
        timeString = minutes.toString() + ':' + seconds.toString() + ' min';
      } else if (seconds > 0 && minutes > 0 && hours > 0) {
        timeString = hours.toString() +
            ':' +
            minutes.toString() +
            ':' +
            seconds.toString() +
            ' min';
      }
    } else {
      timeString = '0:0 Min';
    }

    return timeString;
  }

  /*static Future<Position> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('latittude===$position');
    return position;
  }*/

  static String formatDate(DateTime date) {
    var formatter = new DateFormat('dd MMM, yyyy');
    String formatted = formatter.format(date);
    formatter = DateFormat.jm();

    formatted = formatted + " - " + formatter.format(date);

    return formatted;
  }

  static String attendaceDateFormate(DateTime date) {
    var formatter = new DateFormat('dd MMM, yyyy');
    String formatted = formatter.format(date);
//    formatter = DateFormat.jm();
//
//    formatted = formatted + " - " + formatter.format(date);

    return formatted;
  }

  static String attendaceParamDateFormate(DateTime date) {
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(date);
//    formatter = DateFormat.jm();
//
//    formatted = formatted + " - " + formatter.format(date);

    return formatted;
  }

  static bool isMobileNumber(String phoneNumber, String defaultCountryCode) {
    if (phoneNumber == null) {
      return false;
    }
    if (phoneNumber.startsWith("5")) {
      phoneNumber = '0' + phoneNumber;
    }

    if (phoneNumber.startsWith("+" + defaultCountryCode) ||
        phoneNumber.startsWith(defaultCountryCode) ||
        phoneNumber.startsWith("0")) {
      List<String> arr = [
        "050",
        "052",
        "055",
        "056",
        "054",
        "058",
        "97150",
        "97152",
        "97155",
        "97156",
        "97154",
        "97158"
      ];
      String newNumber = phoneNumber.replaceFirst("+", "");
      for (String prefix in arr) {
        if (newNumber.startsWith(prefix)) {
          return true;
        }
      }
    }
    return false;
  }

  static Future<bool> isInternetAvailable() async {
    var connectivityResult = await new Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> pingCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
    }
    return false;
  }

  static String formatNum(num number) {
    if (number != null) {
      try {
        final formatter = new NumberFormat("###,###");
        return formatter.format(number);
      } catch (e) {}
    }
    return null;
  }

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String removeAllHtmlTags(String htmlText) {
    if (htmlText == null) return '';
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  static DateTime getDateTimeFromServerStringDateTime(String dateTimeOfServer) {
    dateTimeOfServer = dateTimeOfServer.substring(0, 9);
    return new DateFormat("dd-MM-yyyy").parse(dateTimeOfServer);
  }

  static String getDisplayDate(String serverStringDate) {
    DateTime fromDate = DateTime.now();
    if (serverStringDate != null)
      fromDate = getDateTimeFromServerStringDateTime(serverStringDate);
    return attendaceDateFormate(fromDate);
  }

  static String serverDateTimeFormate(DateTime dateTime) {
    var format = new DateFormat("yyyy-MM-ddThh:mm:ss");
    return format.format(dateTime);
  }

  static String serverTimeFormate(DateTime dateTime) {
    var format = new DateFormat("hh:mm a");
    return format.format(dateTime);
  }

  static String firstLetterCapital(String val) {
    return val.substring(0, 1).toUpperCase() + val.substring(1);
  }

  static String convertDateToString(
      {@required DateTime date, @required String expectedFormat}) {
    try {
      final _dateFormat = DateFormat(expectedFormat);
      return (_dateFormat.format(date));
    } catch (e) {
      print('Utility.convertDateToString: ' + e.toString());
      return '';
    }
  }

  static String convertServerDateToString(
      {@required String serverDate, @required String expectedFormat}) {
    try {
      final _dateFormat = DateFormat(expectedFormat);
      DateTime _parsedDate = DateTime.parse(serverDate);
      return (_dateFormat.format(_parsedDate));
    } catch (e) {
      print('Utility.convertServerDateToString: ' + e.toString());
      return '';
    }
  }

  static String convertServerDateTimeToTime(
      {@required String serverDate, @required bool is24hour}) {
    try {
      final _dateFormat = DateFormat(is24hour ? 'HH:mm' : 'hh:mm a');
      DateTime _parsedDate = DateTime.parse(serverDate);
      return (_dateFormat.format(_parsedDate));
    } catch (e) {
      print('Utility.convertServerDateToString: ' + e.toString());
      return '';
    }
  }

  static DateTime convertGameTime({@required String serverDate}) {
    try {
      final _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      DateTime _parsedDate = DateTime.parse(serverDate);
      String formattedDate = _dateFormat.format(_parsedDate);
      return (DateTime.parse(formattedDate));
    } catch (e) {
      print('Utility.convertGameTime: ' + e.toString());
      return DateTime.now();
    }
  }

  static DateTime getCurrentDateTime() {
    try {
      final _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
      return (DateTime.parse(_dateFormat.format(DateTime.now())));
    } catch (e) {
      print('Utility.currentDateTime: ' + e.toString());
      return DateTime.now();
    }
  }
}
