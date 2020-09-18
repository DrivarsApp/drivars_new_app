import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gogame/app.dart';
import 'package:gogame/locator.dart';
import 'package:gogame/ui/shared/shared_preference.dart';

import 'constants/route_names.dart';

void main() {
  setupLocator();
  Fimber.plantTree(DebugTree());
//  SharedPreferences.setMockInitialValues({});
  // app code here ...
  // DebugTree options for time elapsed
  // by default DebugTree will output timestamp of the VM/Flutter app
  // to enable elapsed time since planting the tree log
  Fimber.plantTree(DebugTree.elapsed());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    //DeviceOrientation.landscapeLeft,
  ]);
  checkUserLoggedInOrNot();
//  runApp(MyApp(LoginViewRoute));
}

void checkUserLoggedInOrNot() async {
  bool isLogin = await UserPreference.getUserLogin();
  if (isLogin == true) {
    runApp(
      MyApp(DashboardViewRoute),
    );
  } else {
    runApp(
      MyApp(LoginViewRoute),
    );
  }
}
