import 'package:flutter/material.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/ui/shared/app_colors.dart';

import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/user/login/LoginViewModel.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomBorderButton.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gogame/ui/widgets/terms_and_conditions.dart';
import 'package:gogame/ui/widgets/textfieldcustom.dart';
import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/languageContstants.dart';
import '../../../shared/size_config.dart';
import '../../../widgets/AppCustomButton.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with BaseCommonWidget {
  TextEditingController _mobileController = TextEditingController();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(context),
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

  Widget _getBody(LoginViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(LoginViewModel model) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: SizeConfig.relativeHeight(35),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                ),
                child: SvgPicture.asset(
                  ImagesPaths.iconCityDrivers,
                  fit: BoxFit.cover,
                ),
              ),
              SizeConfig.verticalSpacer(1),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.relativeHeight(1.60),
                ),
                height: SizeConfig.relativeHeight(40),
                width: SizeConfig.relativeWidth(90),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Text(
                      "Welcome to Drivars",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interBold,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(24),
                      ),
                    ),
                    Text(
                      "Please enter your phone number\nto continue",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interBold,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    SizeConfig.verticalSpacer(3),
                    Container(
                      width: SizeConfig.relativeWidth(63),
                      child: TextFieldCustom(
                        labelText: 'Enter your Mobile Number',
                        textController: _mobileController,
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.5),
                    Container(
                      height: SizeConfig.relativeHeight(7.39),
                      width: SizeConfig.relativeWidth(30),
                      child: CustomBorderButton(
                        title: 'Send OTP',
                        onPress: () {
                          model.redirectToPage(OTPViewRoute);
                        },
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.5),
                    Text(
                      "Resend OTP",
                      style: TextStyle(fontFamily: AppTheme.interBold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
