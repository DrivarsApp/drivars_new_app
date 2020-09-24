import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/payment/PaymentViewModel.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:social_share/social_share.dart';

class ReferView extends StatefulWidget {
  @override
  _ReferViewState createState() => _ReferViewState();
}

class _ReferViewState extends State<ReferView> with BaseCommonWidget {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<PaymentViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: PaymentViewModel(context),
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

  Widget _getBody(PaymentViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(PaymentViewModel model) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.yellow,
//        leading: InkWell(
//          onTap: () {},
//          child: Icon(
//            MdiIcons.viewDashboardOutline,
//            size: SizeConfig.relativeWidth(7.3),
//            color: AppColors.white,
//          ),
//        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: AppColors.white,
              size: SizeConfig.relativeWidth(7.3),
            ),
            onPressed: () {},
          ),
        ],
      ),
//      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(2.42),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                ImagesPaths.iconSavings,
                height: SizeConfig.relativeHeight(34.93),
              ),
              SizeConfig.verticalSpacer(2),
              Container(
                width: SizeConfig.relativeWidth(68),
                height: SizeConfig.relativeHeight(11.90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Refer & Earn Drivars Credits ",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    Text(
                      "DRIVARS 9123",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interBold,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(18.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      ImagesPaths.iconTwitter,
                      width: SizeConfig.relativeWidth(10.5),
                      height: SizeConfig.relativeWidth(10.5),
                    ),
                    onPressed: () {
                      SocialShare.shareTwitter("Hello World");
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      ImagesPaths.iconFacebook,
                      width: SizeConfig.relativeWidth(10.5),
                      height: SizeConfig.relativeWidth(10.5),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      ImagesPaths.iconInstagram,
                      width: SizeConfig.relativeWidth(10.5),
                      height: SizeConfig.relativeWidth(10.5),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.whatsapp,
                      color: AppColors.white,
                      size: SizeConfig.relativeWidth(10.3),
                    ),
                    onPressed: () {
                      SocialShare.shareWhatsapp("Hello World");
                    },
                  ),
                ],
              ),
              SizeConfig.verticalSpacer(2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.relativeWidth(2.5),
                  vertical: SizeConfig.relativeHeight(1.3),
                ),
                width: double.infinity,
                height: SizeConfig.relativeHeight(28.92),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getReferDetails('Note:'),
                    SizeConfig.verticalSpacer(1),
                    _getReferDetails(
                      "1. You can share referral code with any one ",
                    ),
                    SizeConfig.verticalSpacer(1),
                    _getReferDetails(
                      "2. One user can use this code at a time only ",
                    ),
                    SizeConfig.verticalSpacer(1),
                    _getReferDetails(
                      "3. Every user will get 100 Credit point on referral ",
                    ),
                    SizeConfig.verticalSpacer(1),
                    _getReferDetails(
                      "4. Credit Points are equal with the same number of amount that full can be used for driver payment",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getReferDetails(String referText) {
    return Text(
      referText,
      style: TextStyle(
        color: AppColors.blackLight,
        fontFamily: AppTheme.interRegular,
        fontStyle: FontStyle.normal,
        fontSize: SizeConfig.setSp(14.0),
      ),
    );
  }
}
