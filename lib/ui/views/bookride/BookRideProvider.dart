import 'package:flutter/foundation.dart';

class BookRideProvider with ChangeNotifier {
  String dateTimeValue;

  void updateDateTime(String value) {
    dateTimeValue = value;
    notifyListeners();
  }
}
