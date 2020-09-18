import 'package:flutter/material.dart';
import 'package:gogame/locator.dart';
import 'package:gogame/models/user_provider.dart';
import 'package:gogame/services/navigation_service.dart';
import 'package:gogame/ui/router.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'managers/dialog_manager.dart';

class MyApp extends StatelessWidget {
  final String routePath;
  MyApp(this.routePath);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: true,
        title: 'Go Game',
        builder: (context, child) => ScrollConfiguration(
          behavior: CustomScrollBehaviour(),
          child: Navigator(
            key: locator<DialogService>().dialogNavigationKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => DialogManager(child: child)),
          ),
        ),
        navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
          primaryColor: Colors.white,
          backgroundColor: Colors.blue,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: AppTheme.interRegular,
              ),
        ),
        initialRoute: routePath,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
