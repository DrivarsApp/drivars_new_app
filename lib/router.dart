import 'package:flutter/material.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/ui/views/Permissions/PermissionView.dart';
import 'package:gogame/ui/views/ProfileScreen/ProfileRideView.dart';
import 'package:gogame/ui/views/SelectCar/SelectCarView.dart';
import 'package:gogame/ui/views/SelectCity/SelectCityView.dart';
import 'package:gogame/ui/views/Select_Time/SelectTimeView.dart';
import 'package:gogame/ui/views/SplashScreen/SplashView.dart';
import 'package:gogame/ui/views/ThankuPopup/ThankPopupView.dart';
import 'package:gogame/ui/views/bookride/BookRideProvider.dart';
import 'package:gogame/ui/views/bookride/BookRideView.dart';
import 'package:gogame/ui/views/dashboard/DashboardView.dart';
import 'package:gogame/ui/views/order/OrderProvider.dart';
import 'package:gogame/ui/views/order/OrderView.dart';
import 'package:gogame/ui/views/payment/PaymentProvider.dart';
import 'package:gogame/ui/views/payment/PaymentView.dart';
import 'package:gogame/ui/views/refer/ReferView.dart';
import 'package:gogame/ui/views/user/login/LoginView.dart';

import 'package:gogame/ui/views/user/otp/OTPVerifyView.dart';
import 'package:gogame/ui/views/user/username/UsernameView.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case UsernameViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UsernameView(
          params: settings.arguments,
        ),
      );
    case DashboardViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DashboardView(),
      );

    case SplashViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashView(),
      );
    case PermissionViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PermissionView(),
      );
    case ReferViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ReferView(),
      );
    case PaymentViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ChangeNotifierProvider<PaymentProvider>(
          create: (context) => PaymentProvider(),
          child: PaymentView(),
        ),
      );
    case OrderViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ChangeNotifierProvider<OrderProvider>(
          create: (context) => OrderProvider(),
          child: OrderView(),
        ),
      );
    case BookRideViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ChangeNotifierProvider<BookRideProvider>(
          create: (BuildContext context) => BookRideProvider(),
          child: BookRideView(),
        ),
      );

    case OTPViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OTPVerifyView(),
      );
    case ProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ProfileView(),
      );
    case ThankPopupViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ThankPopupView(),
      );
    case SelectCityViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SelectCityView(),
      );

//    case PayViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: PayView(),
//      );
//    case AnalyticsViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<AnalyticsProvider>(
//          create: (context) => AnalyticsProvider(),
//          child: AnalyticsView(),
//        ),
//      );
//    case AddBankAccountViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: AddBankAccountView(),
//      );
//    case AddUPIViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: AddUPIView(),
//      );
//    case AddWalletViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: AddWalletView(),
//      );
//    case NetBankingViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: NetBankingView(),
//      );
//    case PromocodeViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<PromocodeProvider>(
//          create: (context) => PromocodeProvider(),
//          child: PromocodeView(),
//        ),
//      );
//    case ProfileAccountViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ProfileAccountView(),
//      );
//    case EditProfileViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: EditProfileView(),
//      );
//    case FansViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: FansView(),
//      );
//    case UpdatesViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: UpdatesView(),
//      );
//    case PaymentAlertViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: PaymentAlertView(),
//      );
//    case LogoutViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: LogoutView(),
//      );
//    case BonusViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: BonusView(),
//      );
//    case LevelsViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: LevelsView(),
//      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  print('Navigating To $routeName');
  return PageTransition(
      type: PageTransitionType.rightToLeft, child: SafeArea(child: viewToShow));
}
