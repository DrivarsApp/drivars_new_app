import 'package:flutter/material.dart';
import 'package:gogame/viewmodels/base_model.dart';

class DashboardViewModel extends BaseModel {
  bool tabSelected = true;

  DashboardViewModel(BuildContext newContext) {
    context = newContext;
  }

  void updateTabSelected(bool val) {
    tabSelected = val;
    notifyListeners();
  }
}
