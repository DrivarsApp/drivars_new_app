import 'package:flutter/material.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/models/game_data.dart';
import 'package:gogame/ui/views/Permissions/PermissionView.dart';
import 'package:gogame/ui/views/SelectCar/SelectCarView.dart';
import 'package:gogame/ui/views/Select_Time/SelectTimeView.dart';
import 'package:gogame/ui/views/SplashScreen/SplashView.dart';
import 'package:gogame/ui/views/dashboard/DashboardView.dart';
import 'package:gogame/ui/views/user/login/LoginView.dart';

import 'package:gogame/ui/views/user/otp/OTPVerifyView.dart';
import 'package:gogame/ui/views/user/username/UsernameView.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(routeName: settings.name, viewToShow: LoginView());
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
    case SelectCarViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SelectCarView(),
      );
    case SelectTimeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SelectTimeView(),
      );
    case SplashViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow:  SplashView(),
      );
    case PermissionViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow:  PermissionView(),
      );

//    case SettingViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<SettingProvider>(
//          create: (BuildContext context) => SettingProvider(),
//          child: SettingView(),
//        ),
//      );
//    case GameViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: GameView(),
//      );
//    case FeedbackViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<FeedbackProvider>(
//          create: (BuildContext context) => FeedbackProvider(),
//          child: FeedbackView(),
//        ),
//      );
//    case HelpDeskViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: HelpDeskView(),
//      );
//    case LightCoinsViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<LightCoinsProvider>(
//          create: (context) => LightCoinsProvider(),
//          child: LightCoinsView(),
//        ),
//      );
//    case AddCashViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<AddCashProvider>(
//          create: (context) => AddCashProvider(),
//          child: AddCashView(),
//        ),
//      );
//    case PaymentHistoryViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: PaymentHistoryView(
//          params: settings.arguments,
//        ),
//      );
//    case TournamentHistoryViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: TournamentHistoryView(),
//      );
//
//    case GameTournamentDescViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: GameTournamentDescView(),
//      );
//    case ReferralViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<ReferralProvider>(
//          create: (context) => ReferralProvider(),
//          child: ReferralView(),
//        ),
//      );
//    case RewardsViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: RewardsView(),
//      );
//    case PrizeViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<PrizeProvider>(
//          create: (BuildContext context) => PrizeProvider(),
//          child: PrizeView(params: settings.arguments),
//        ),
//      );
//    case KYCViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ChangeNotifierProvider<KYCProvider>(
//          create: (BuildContext context) => KYCProvider(),
//          child: KYCView(),
//        ),
//      );
//    case ProfileViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ProfileView(),
//      );
//    case WithdrawCashViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: WithdrawCashView(),
//      );
//    case ImageViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: ImageView(
//          params: settings.arguments,
//        ),
//      );
//    case UnityViewRoute:
//      return _getPageRoute(
//        routeName: settings.name,
//        viewToShow: UnityView(settings.arguments as GameData),
//      );

  //New Version
    case OTPViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OTPVerifyView(),
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
