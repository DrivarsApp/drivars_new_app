import 'package:flutter/material.dart';
import 'package:gogame/viewmodels/base_model.dart';

class ThankPopupViewModel extends BaseModel {
  bool cashSelected = true;

  ThankPopupViewModel(BuildContext newContext) {
    context = newContext;
  }
}
