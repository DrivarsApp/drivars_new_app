import 'package:flutter/material.dart';
import 'package:gogame/viewmodels/base_model.dart';

class ProfileViewModel extends BaseModel {
  bool cashSelected = true;

  ProfileViewModel(BuildContext newContext) {
    context = newContext;
  }
  void menuSelected(bool val) {
    cashSelected = val;
    notifyListeners();
  }
}
