import 'package:flutter/material.dart';
import 'package:gogame/viewmodels/base_model.dart';

class SelectTimeViewModel extends BaseModel {
  bool cashSelected = true;

  SelectTimeViewModel(BuildContext newContext) {
    context = newContext;
  }


}
