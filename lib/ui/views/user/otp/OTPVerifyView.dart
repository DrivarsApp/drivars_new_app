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
                height:SizeConfig.relativeHeight(35),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:Hexcolor('#205cbe'),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizeConfig.verticalSpacer(2),
              Text("We have sent otp to +91 7805977569\n Please go back if its not correct",
                style: TextStyle(
                    color:Colors.blueGrey,
                    fontFamily: AppTheme.interBold,
                    fontStyle:  FontStyle.normal,
                    fontSize: SizeConfig.setSp(18)
                ),),
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
                width:SizeConfig.relativeWidth(55),
                padding: EdgeInsets.only(
                  left: SizeConfig.relativeWidth(7.52),
                  right: SizeConfig.relativeWidth(7.52),
                ),
                child: CustomButton(
                  title: 'Login',
                  onPress: () {
                    Navigator.pop(context);
                    model.redirectToPage(PermissionViewRoute);
//
                    //_showModalSheet(context, model);
                  },
                ),
              ),


//              Container(
//                height:SizeConfig.relativeHeight(40),
//                width:SizeConfig.relativeWidth(90),
//                decoration: BoxDecoration(
//                  color: Hexcolor("#ffc100"),
//                  borderRadius: BorderRadius.circular(25),
//                ),
//                child: Column(
//                  children: [
//                    SizeConfig.verticalSpacer(2),
//                    Text("Welcome to Drivars",
//                      style: TextStyle(
//                          color:Colors.blueGrey,
//                          fontFamily: AppTheme.interBold,
//                          fontStyle:  FontStyle.normal,
//                          fontSize: SizeConfig.setSp(24)
//                      ),),
//                    Text("Please enter your phone number\nto continue",
//                      style: TextStyle(
//                          color:Colors.blueGrey,
//                          fontFamily: AppTheme.interBold,
//                          fontStyle:  FontStyle.normal,
//                          fontSize: 14.0
//                      ),),
//                    SizeConfig.verticalSpacer(3),
//                    Container(
//                      width: SizeConfig.relativeWidth(55),
//                      child: TextField(
//                        keyboardType:TextInputType.number ,
//                        decoration: InputDecoration(
//                            hintText: "Enter your number"
//                        ),
//                      ),
//                    ),
//                    SizeConfig.verticalSpacer(3),
//
//                    Container(
//                      height: SizeConfig.relativeHeight(7.39),
//                      width:SizeConfig.relativeWidth(50),
//
//                      padding: EdgeInsets.only(
//                        left: SizeConfig.relativeWidth(7.52),
//                        right: SizeConfig.relativeWidth(7.52),
//                      ),
//                      child: CustomButton(
//                        title: 'Send OTP',
//                        onPress: () {
//                          Navigator.pop(context);
//                          model.redirectToPage(OTPViewRoute);
////
//                          //_showModalSheet(context, model);
//                        },
//                      ),
//                    ),
//
////                   Container(
////                     height:SizeConfig.relativeHeight(6),
////                     width:SizeConfig.relativeWidth(30),
////                     decoration: BoxDecoration(
////                       color: Hexcolor("#205cbe"),
////                       borderRadius: BorderRadius.circular(10),
////                     ),
////                     child: Align(
////                         alignment:Alignment.center
////                         ,child: Text("Send OTP",style: TextStyle(color: Colors.white),)),
////                   ),
//                    SizeConfig.verticalSpacer(2),
//                    Text("Resend OTP",style: TextStyle(fontFamily: AppTheme.interBold),)
//                  ],
//                ),
//
//              )

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
