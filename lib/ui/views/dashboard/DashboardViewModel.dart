import 'package:flutter/material.dart';
import 'package:gogame/viewmodels/base_model.dart';

class DashboardViewModel extends BaseModel {
  bool cashSelected = true;

  DashboardViewModel(BuildContext newContext) {
    context = newContext;
  }

  void init() {}

  void menuSelected(bool val) {
    cashSelected = val;
    notifyListeners();
  }
}
