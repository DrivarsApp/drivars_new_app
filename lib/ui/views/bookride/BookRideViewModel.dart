import 'package:flutter/material.dart';
import 'package:gogame/ui/views/BookRide/BookRideProvider.dart';
import 'package:gogame/viewmodels/base_model.dart';
import 'package:provider/provider.dart';

class BookRideViewModel extends BaseModel {
  bool cashSelected = true;

  BookRideViewModel(BuildContext newContext) {
    context = newContext;
  }

  void updateDateTimeValue(String newVal) {
    Provider.of<BookRideProvider>(context).updateDateTime(newVal);
  }
}
