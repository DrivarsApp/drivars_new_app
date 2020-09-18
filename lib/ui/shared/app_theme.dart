import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppTheme {
  //Size size;

  AppTheme._();

  //Number formatting
  static final nubmerFormat = NumberFormat("#,##0.00", "en_US");
  static final nubmerFormat2 = NumberFormat("#,##0", "en_US");

  //Fonts
  static String piedraRegular = 'PiedraRegular';
  static String interBlack = 'InterBlack';
  static String interBold = 'InterBold';
  static String interExtraBold = 'InterExtraBold';
  static String interExtraLight = 'InterExtraLight';
  static String interLight = 'InterLight';
  static String interMedium = 'InterMedium';
  static String interRegular = 'InterRegular';
  static String interSemiBold = 'InterSemiBold';
  static String interThin = 'InterThin';
  static String lemonMilkMedium = 'LEMONMILKMedium';
  static String lemonMilkBold = 'LEMONMILKBold';


  static String ffCelias = 'Celias';
  static String ffRegular = 'Celias';
  static String ffBold = 'Celias';
  static String ffMedium = 'Celias';
  static String billabong = 'Billabong';



  //gogame Icons
  static String iconGoGame = 'assets/images/app_icon.png';
  static String iconChat = 'assets/icons/chat.png';
  static String iconLocation = 'assets/icons/location.png';
  static String iconComment = 'assets/icons/comment.png';
  static String iconLike = 'assets/icons/like.png';
  static String iconSave = 'assets/icons/save.png';
  static String iconShare = 'assets/icons/share.png';
  static String iconBackBtn = 'assets/images/Arrow_Back.png';

  //Images Path
  static String imageAvatar = 'assets/menimage.jpg';
  static String imagePost = 'assets/postImage.png';

  // static String iconAvunja = 'assets/images/avunja-source@3x.png';
  // static String iconAvunja = 'assets/images/avunja-source@3x.png';
  // static String iconAvunja = 'assets/images/avunja-source@3x.png';
  // static String iconAvunja = 'assets/images/avunja-source@3x.png';
  // static String iconAvunja = 'assets/images/avunja-source@3x.png';
  // static String iconAvunja = 'assets/images/avunja-source@3x.png';

  //gogame Images
  static String shopBanner = "assets/images/store_banner.png";
  static String starIcon = "assets/icons/gogameicons/star@3x.png";
  static String iconCall = "assets/icons/gogameicons/call@3x.png";
  static String iconMap = "assets/icons/gogameicons/map@3x.png";
  // static String iconSave = "assets/icons/gogameicons/";
  static String iconMenu = "assets/icons/gogameicons/menu@3x.png";
  static String iconShopFront = "assets/icons/gogameicons/shop.png";

  // Profile screen
  static String shareQR = "assets/images/shareQR.png";
  static String profileSsetting = "assets/images/setting.png";
  static String profileLogout = "assets/images/logout.png";
  static String rightArrow = "assets/images/right_arrow.png";

  //icon Path

  static String iconAvunja = 'assets/images/avunja-source@3x.png';

  static String iconRightAngle = 'assets/icons/right_angle.svg';
  static String iconNotificationBell = 'assets/icons/bell.svg';
  static String iconMore = 'assets/icons/more.svg';
  static String iconEdit = 'assets/icons/edit.svg';
  static String iconEditDark = 'assets/icons/edit_dark.svg';

  static String iconProfileBackgroundImage =
      'assets/icons/profile_background_circle.svg';
  static String iconProfilePlaceHolder = 'assets/icons/profile_pic.svg';
  static String iconAddRound = 'assets/icons/add_round.svg';
  static String iconCheck = 'assets/icons/check.png';
  static String iconWithdraw = 'assets/icons/withdraw.svg';
  static String iconTopUp = 'assets/icons/topup.svg';
  static String iconImage = 'assets/icons/image.svg';
  static String iconChecked = 'assets/icons/check.svg';
  static String iconHelpAndSupport = 'assets/icons/help_and_support.svg';
  static String iconMoreOptions = 'assets/icons/more_option.svg';
  static String iconBack = 'assets/icons/back.svg';
  static String iconOpenDrawer = 'assets/icons/open_drawer.svg';
  static String iconOpenDrawer2 = 'assets/icons/notes.svg';
  static String iconNotifications = 'assets/icons/bell2.svg';
  static String iconSecurityLock = 'assets/icons/security_lock.svg';
  static String iconAccountInfo = 'assets/icons/account_info.svg';
  static String iconOldAgePhone = 'assets/icons/old_age_phone.svg';
  static String iconNewAgePhone = 'assets/icons/new_age_phone.svg';
  static String iconVerticalMore = 'assets/icons/vertical_more.svg';
  static String iconWarning = 'assets/icons/warning.svg';
  static String iconCamera = 'assets/icons/camera.svg';
  static String iconDropDown = 'assets/icons/drop_down.svg';
  static String iconInstagram = 'assets/icons/instagram.svg';
  static String iconFacebook = 'assets/icons/instagram.svg';
  static String iconGoogle = 'assets/icons/instagram.svg';
  static String iconSanpChat = 'assets/icons/instagram.svg';
  static String iconPinterest = 'assets/icons/pinterest.svg';
  static String iconTwitter = 'assets/icons/instagram.svg';
  static String iconReset = 'assets/icons/reset.svg';
  static String iconGroupBank = 'assets/icons/group_bank.svg';
  static String iconFullScreen = 'assets/icons/full_screen.svg';
  static String iconBackArrow = 'assets/icons/back_arrow.svg';
  static String imageGroupDetail = 'assets/images/group_detail_image.jpg';
  static String iconTextMessage = 'assets/icons/chat/text_message.svg';
  static String iconAudiCall = 'assets/icons/chat/audiocall.svg';
  static String iconMessageChat = 'assets/icons/chat/message.svg';
  static String iconVideoCall = 'assets/icons/chat/videocall.svg';
  static String iconLock = 'assets/icons/chat/lock.svg';

  static String iconAttach = 'assets/icons/attach.svg';
  static String iconMicrophone = 'assets/icons/microphone.svg';
  static String iconSmile = 'assets/icons/smile.svg';

  static String iconDelete = 'assets/icons/delete.svg';
  static String iconEdit2 = 'assets/icons/edit_icon.svg';
  static String iconFilter = 'assets/icons/filter.svg';

  static String iconBank = 'assets/icons/topup/bank.svg';
  static String iconMobile = 'assets/icons/topup/mobile.svg';
  static String iconRedCheck = 'assets/icons/topup/red_check.svg';
  static String iconCircularCheck = 'assets/icons/circular_check.svg';

  static String iconVisa = 'assets/icons/topup/visa.svg';
  static String iconMastercard = 'assets/icons/topup/mastercard.svg';
  static String iconPaypal = 'assets/icons/topup/paypal.svg';

  static String iconDropDownExpanded = 'assets/icons/drop_down_expanded.svg';
  static String iconInviteFriends = 'assets/icons/invite_friends.svg';
  static String iconMessage = 'assets/icons/message.svg';
  static String iconSearch = 'assets/icons/search.svg';
//  static String iconShare = 'assets/icons/share.svg';
  static String iconDrawer = 'assets/icons/drawer.svg';

  static String imageFacebook = 'assets/images/facebook@3x.png';
  static String imageGoogle = 'assets/images/google@3x.png';
  static String imageTwitter = 'assets/images/twitter@3x.png';
  static String imageProfilePlaceHolder =
      'assets/images/user_profile_place_holder.png';


//  static String iconDropDownExpanded = 'assets/icons/drop_down_expanded.svg';
//  static String iconDropDownExpanded = 'assets/icons/drop_down_expanded.svg';
//  static String iconDropDownExpanded = 'assets/icons/drop_down_expanded.svg';
//  static String iconDropDownExpanded = 'assets/icons/drop_down_expanded.svg';
//  static String iconDropDownExpanded = 'assets/icons/drop_down_expanded.svg';

  static Color plGreyColor = Color(0xFFFAEBEA);
  static Color plGreyColor2 = Color(0xFF83928A);
  static Color plGreyColor22 = Color(0xFFCACFCC);
  static Color plGreyColor3 = Color(0xFFA6B5AD);
  static Color plRedColor = Color(0xffd0021b);
  static Color backgroundColor = Colors.white;
  static Color primary0TextColor = Color(0xFFFFFFFF);
  static Color primaryTextColor = Color(0xFF222222);
  static Color textColorBlack = Color(0xff30333c);

  static Color text1Color = Color(0xFF303030);
  static Color text2Color = Color(0xFF272727);
  static Color text3Color = Color(0xFF24253d);

  static Color text4Color = Colors.grey;
  static Color text5Color = Color(0xff858585);
  static Color text6Color = Color(0xff232323);
  static Color text7Color = Color(0xff5a5a5a);
  static Color text8Color = Color(0xff333333);
  static Color text9Color = Color(0xff7b7b7b);

  static Color chipsBorder = Color(0xffdfdfdf);

  static Color greenColor = Color(0xff49a12f);
  static Color cardBgGrayColor = Color(0xfffafafa);
  static Color textFieldUnderLineColor = Color(0xfff2f2f2);
  static Color switchActiveTrackColor = Color(0xff7ed321);
  static Color switchInactiveTrackColor = Color(0x32d0021b);
  static Color paymentWidgetBgColor = Color(0xFFFAFAFA);
  static const Color dividerColor = Color(0xfff2f2f2);
  static Color shadowColor = Color(0x7fd8d8d8);

  static Color popColor = Color(0xFF1E88e5);

  static double primaryTextSize = 15.0;

  static TextStyle titleTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: ffRegular,
    color: primaryTextColor,
    height: 1.11,
  );

  static TextStyle title2TextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: ffRegular,
    fontWeight: FontWeight.w600,
    color: text1Color,
    letterSpacing: 0.56,
    height: 1,
  );

  static TextStyle title3TextStyle = TextStyle(
    fontSize: 19.0,
    fontFamily: ffRegular,
    fontWeight: FontWeight.w600,
    color: text1Color,
    height: 1.05,
  );

  static TextStyle title4TextStyle = TextStyle(
    fontSize: 12.0,
    fontFamily: ffRegular,
    color: text1Color,
    height: 1.67,
  );

  static TextStyle title5TextStyle = TextStyle(
    fontSize: 16.6,
    fontFamily: ffRegular,
    color: Color(0xFF696969),
    height: 1.5,
  );

  static TextStyle titleTextOpacityStyle = TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 15.0,
    fontFamily: ffRegular,
    color: text2Color,
    height: 1.61,
  );

  static TextStyle titleTextOpacity2Style = TextStyle(
    fontSize: 12.0,
    fontFamily: ffRegular,
    color: text2Color,
    height: 1.29,
    fontStyle: FontStyle.italic,
  );

  static TextStyle boldTextStyle = TextStyle(
    fontSize: 22.0,
    fontFamily: ffBold,
    color: primaryTextColor,
    height: 0.91,
  );

  static TextStyle bold2TextStyle = TextStyle(
    fontSize: 13.0,
    fontFamily: ffBold,
    color: primaryTextColor,
    height: 1.85,
  );

  static TextStyle bold3TextStyle = TextStyle(
    fontSize: 25.0,
    fontFamily: ffBold,
    color: plRedColor,
    height: 1.2,
  );

  static TextStyle bold4TextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: ffBold,
    color: text1Color,
  );

  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: const EdgeInsets.only(
      left: 20,
      top: 8.0,
      bottom: 8.0,
    ),
    enabledBorder: new UnderlineInputBorder(
      borderSide: new BorderSide(color: Color(0xFFDDDDDD)),
    ),
    focusedBorder: new UnderlineInputBorder(
      borderSide: new BorderSide(color: Color(0xFFDDDDDD)),
    ),
    labelStyle: AppTheme.titleTextStyle,
  );

  static InputDecoration inputDecorationWithIcon(String path) =>
      inputDecoration.copyWith(
          hintStyle: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 14.0,
            fontFamily: ffRegular,
            color: Color(0XFF5a5a5a),
          ),
          hintText: 'Mobile Number',
          prefixIconConstraints: BoxConstraints(
            maxHeight: SizeConfig.relativeWidth(10),
            maxWidth: SizeConfig.relativeWidth(10),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: SizeConfig.relativeWidth(5)),
            child: Image.asset(
              path,
              fit: BoxFit.contain,
            ),
          ));

  static get() {
    return ThemeData(
      fontFamily: ffRegular,
      brightness: Brightness.light,
      primaryColor: primaryTextColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        brightness: Brightness.light,
        color: backgroundColor,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static getContentPadding() {
    return EdgeInsets.only(
        left: SizeConfig.relativeWidth(4.26),
        right: SizeConfig.relativeWidth(4.26));
  }
}
