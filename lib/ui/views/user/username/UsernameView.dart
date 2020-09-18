import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:gogame/ui/widgets/terms_and_conditions.dart';
import 'package:gogame/viewmodels/base_model.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constants/languageContstants.dart';
import '../../../shared/size_config.dart';
import '../../../widgets/AppCustomButton.dart';
import 'UsernameViewModel.dart';

class UsernameView extends StatefulWidget {
  final Map<String, dynamic> params;
  @override
  _UsernameViewState createState() => _UsernameViewState();

  UsernameView({this.params});
}

class _UsernameViewState extends State<UsernameView> with BaseCommonWidget {
  TextEditingController usernameController = new TextEditingController();


  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UsernameViewModel>.withConsumer(
      viewModel: UsernameViewModel(context),
      onModelReady: (model) => model.setUserData(widget.params),
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

  Widget _getBody(UsernameViewModel model) {
    return Stack(
      children: <Widget>[
        _getBaseContainer(model),
        getProgressBar(model.state),
      ],
    );
  }

  _getBaseContainer(UsernameViewModel model) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //gogame image
              Container(
                padding: EdgeInsets.only(
                  top: SizeConfig.relativeHeight(2.52),
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(ImagesPaths.iconGoGame),
                    width: SizeConfig.relativeWidth(16.99),
                    height: SizeConfig.relativeHeight(8.40),
                  ),
                ),
              ),

              //vertical spacer
              SizeConfig.verticalSpacer(3.09),

              //Hello Adventurer container
              _getTextContainer(model),

              //vertical spacer

              SizeConfig.verticalSpacer(8.04),
              //enter email filed
              Container(
                padding: EdgeInsets.only(
                  left: SizeConfig.relativeWidth(4.85),
                  right: SizeConfig.relativeWidth(4.12),
                ),
                child: AppTextField(
                  usernameController,
                  'Create Username',
                  autoFocus: true,
                  readOnly: false,
                  prefilx: Icons.person,
                  hasPrefix: true,
                  keyboardType: TextInputType.text,
                  onSubmitted: (String value) {},
                  onTextChange: (String email) {
                    //model.type = null;
                    setState(() {});
                  },
                ),
              ),
              SizeConfig.verticalSpacer(2.41),
              Container(
                padding: EdgeInsets.only(
                  left: SizeConfig.relativeWidth(4.85),
                ),
                child: Text(
                  'Minimum 8 Characters without Special Characters',
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: AppTheme.interRegular,
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.setSp(12.0),
                  ),
                ),
              ),
              SizeConfig.verticalSpacer(3.33),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.relativeWidth(7.52),
                ),
                child: CustomButton(
                  title: 'Let\'s get started',
                  onPress: () {
                    validateData(model);
                    model.redirectToPage(DashboardViewRoute);
                  },
                ),
              ),
              SizeConfig.verticalSpacer(1.14),

              Center(
                child: TermsAndConditions(
                  text: 'By tapping next, you accept our',
                  linkText: 'Community Guidelines',
                  onPressed: () {
                    launchURL('https://flutter.dev/');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getTextContainer(UsernameViewModel model) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(4.85),
        right: SizeConfig.relativeWidth(4.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hello',
            style: TextStyle(
              fontSize: SizeConfig.setSp(30),
              fontFamily: AppTheme.interRegular,
            ),
          ),
          SimpleTooltip(
              ballonPadding: EdgeInsets.zero,
              tooltipTap: () {
                print("Tooltip tap");
              },
              animationDuration: Duration(seconds: 1),
              maxWidth: SizeConfig.relativeWidth(59.97),
              //maxHeight: SizeConfig.relativeHeight(7),
              arrowLength: SizeConfig.relativeHeight(1.5),
              arrowTipDistance: SizeConfig.relativeWidth(1),
              arrowBaseWidth: SizeConfig.relativeWidth(2),
              borderRadius: 1.0,
              borderColor: AppColors.black,
              show: true,
              tooltipDirection: TooltipDirection.down,
              backgroundColor: AppColors.black,
              content: Text(
                "Your name would look good here!",
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(12),
                  decoration: TextDecoration.none,
                ),
              ),
              child: Text(
                'Gamer',
                style: TextStyle(
                  fontSize: SizeConfig.setSp(30),
                  fontFamily: AppTheme.interBold,
                ),
              )

//          SimpleTooltip(
//            animationDuration: Duration(seconds: 1),
//            hideOnTooltipTap: true,
//            maxWidth: SizeConfig.relativeWidth(50),
//            maxHeight: SizeConfig.relativeHeight(3.90),
//            arrowLength: SizeConfig.relativeHeight(1.5),
//            arrowTipDistance: SizeConfig.relativeWidth(1),
//            arrowBaseWidth: SizeConfig.relativeWidth(2),
//            borderRadius: 1.0,
//            borderColor: AppColors.black,
//            backgroundColor: AppColors.black,
//            show: true,
//            tooltipDirection: TooltipDirection.down,
//            content: Text(
//              'Some text example!!!!',
//              style: TextStyle(
//                color: Colors.black,
//                fontSize: 18,
//                decoration: TextDecoration.none,
//              ),
//            ),
//            child: Text(
//              'Gamer',
//              style: TextStyle(
//                fontSize: SizeConfig.setSp(33),
//                fontFamily: AppTheme.interSemiBold,
//              ),
//            ),
//          )
              ),
        ],
      ),
    );
  }

  void launchURL(String urlText) async {
    String url = urlText;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void validateData(UsernameViewModel model) {
    FocusScope.of(context).unfocus();
    if (usernameController.text.trim().length <= 2) {
      model.showMessageInFlushBar('too short username', true);
      return;
    }
    model.checkUsername(usernameController.text.trim());
  }
}
