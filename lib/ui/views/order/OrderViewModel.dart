import 'package:flutter/material.dart';

import 'package:gogame/viewmodels/base_model.dart';

class OrderViewModel extends BaseModel {
  bool tabSelected = true;
  OrderViewModel(BuildContext newContext) {
    context = newContext;
  }

  void updateTabSelected(bool val) {
    tabSelected = val;
    notifyListeners();
  }
}
