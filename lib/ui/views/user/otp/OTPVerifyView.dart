import 'package:flutter/material.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/user/login/LoginViewModel.dart';
import 'package:gogame/ui/views/user/otp/OTPVerifyViewModel.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomBorderButton.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:gogame/ui/widgets/OTP_entry_text_field.dart';
import 'package:gogame/ui/widgets/terms_and_conditions.dart';
import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:gogame/ui/shared/app_theme.dart';

import '../../../../constants/languageContstants.dart';
import '../../../shared/size_config.dart';
import '../../../widgets/AppCustomButton.dart';

class OTPVerifyView extends StatefulWidget {
  @override
  _OTPVerifyViewState createState() => _OTPVerifyViewState();
}

class _OTPVerifyViewState extends State<OTPVerifyView> with BaseCommonWidget {
  TextEditingController mobileController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<OTPVerifyViewModel>.withConsumer(
      viewModel: OTPVerifyViewModel(context),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SafeArea(
            child: LayoutBuilder(
              builder: (ctx, constraints) {
                SizeConfig().init(ctx, constraints);
                return _getBody(model);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getBody(OTPVerifyViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(OTPVerifyViewModel model) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: SizeConfig.relativeHeight(35),
                width: double.infinity,
                color: AppColors.blue,
              ),
              SizeConfig.verticalSpacer(2),
              Text(
                "We have sent OTP to +91 7805977569\nPlease go back if it\'s not correct",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interBold,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(16.0),
                ),
              ),
              SizeConfig.verticalSpacer(2),
              OTPTextField(
                pinBoxHeight: SizeConfig.relativeHeight(5.97),
                pinBoxWidth: SizeConfig.relativeWidth(11.65),
                controller: otpController,
                pinTextStyle: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppTheme.interBold,
                  fontSize: SizeConfig.setSp(22),
                ),
//                onDone: (String OTP) {
//                  if (OTP.length == 6) {
//                    model.verifyOTP(OTP);
//                  }
//                },
              ),
              SizeConfig.verticalSpacer(3),
              Container(
                height: SizeConfig.relativeHeight(7.0),
                width: SizeConfig.relativeWidth(55),
                padding: EdgeInsets.only(
                  left: SizeConfig.relativeWidth(7.52),
                  right: SizeConfig.relativeWidth(7.52),
                ),
                child: CustomBorderButton(
                  title: 'Login',
                  onPress: () {
                    model.redirectToPage(PermissionViewRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getTextContainer(OTPVerifyViewModel model) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(4.85),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello',
            //textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: SizeConfig.setSp(30),
              fontFamily: AppTheme.interRegular,
            ),
          ),
          Text(
            'Gamer',
            style: TextStyle(
              fontSize: SizeConfig.setSp(30),
              fontFamily: AppTheme.interBold,
            ),
          )
        ],
      ),
    );
  }

  void verify(String OTP, OTPVerifyViewModel model) {
    if (OTP.length == 6) {
      model.verifyOTP(OTP, mobileController.text.trim());
      model.redirectToPage(UsernameViewRoute);
    }
  }
}
