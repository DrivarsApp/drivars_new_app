import 'package:flutter/material.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';

import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/user/login/LoginViewModel.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomBorderButton.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gogame/ui/widgets/terms_and_conditions.dart';
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
  TextEditingController mobileController = new TextEditingController();

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
             Container(
               height:SizeConfig.relativeHeight(40),
               width:SizeConfig.relativeWidth(90),
               decoration: BoxDecoration(
                 color: Hexcolor("#ffc100"),
                 borderRadius: BorderRadius.circular(25),
               ),
               child: Column(
                 children: [
                   SizeConfig.verticalSpacer(2),
                   Text("Welcome to Drivars",
                       style: TextStyle(
                       color:Colors.blueGrey,
                       fontFamily: AppTheme.interBold,
                       fontStyle:  FontStyle.normal,
                       fontSize: SizeConfig.setSp(24)
                   ),),
                   Text("Please enter your phone number\nto continue",
                     style: TextStyle(
                         color:Colors.blueGrey,
                         fontFamily: AppTheme.interBold,
                         fontStyle:  FontStyle.normal,
                         fontSize: 14.0
                     ),),
                   SizeConfig.verticalSpacer(3),
                   Container(
                     width: SizeConfig.relativeWidth(55),
                     child: TextField(
                       keyboardType:TextInputType.number ,
                       decoration: InputDecoration(
                         hintText: "Enter your number"
                       ),
                     ),
                   ),
                   SizeConfig.verticalSpacer(3),

                   Container(
                     height: SizeConfig.relativeHeight(7.39),
                     width:SizeConfig.relativeWidth(50),

                     padding: EdgeInsets.only(
                       left: SizeConfig.relativeWidth(7.52),
                       right: SizeConfig.relativeWidth(7.52),
                     ),
                     child: CustomButton(
                       title: 'Send OTP',
                       onPress: () {
                         Navigator.pop(context);
                         model.redirectToPage(OTPViewRoute);
//
                         //_showModalSheet(context, model);
                       },
                     ),
                   ),

//                   Container(
//                     height:SizeConfig.relativeHeight(6),
//                     width:SizeConfig.relativeWidth(30),
//                     decoration: BoxDecoration(
//                       color: Hexcolor("#205cbe"),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Align(
//                         alignment:Alignment.center
//                         ,child: Text("Send OTP",style: TextStyle(color: Colors.white),)),
//                   ),
                   SizeConfig.verticalSpacer(2),
                   Text("Resend OTP",style: TextStyle(fontFamily: AppTheme.interBold),)
                 ],
               ),

             )

           ],
         ),
        ),
      ),
    );
  }



  void validateData(LoginViewModel model) {
    FocusScope.of(context).unfocus();
    if (mobileController.text.trim().length != 10) {
      model.showMessageInFlushBar('Invalid Mobile', true);
      return;
    }
    model.checkLoginDetails(mobileController.text.trim());
  }

  void launchURL(String urlText) async {
    String url = urlText;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
