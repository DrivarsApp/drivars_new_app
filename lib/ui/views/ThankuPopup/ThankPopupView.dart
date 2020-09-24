import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/API.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/models/user_provider.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/Select_Time/SelectTimeViewModel.dart';
import 'package:gogame/ui/views/ThankuPopup/ThankPopupViewModel.dart';
import 'package:gogame/ui/views/dashboard/DashboardViewModel.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:gogame/ui/widgets/PickupdropContainer.dart';

import 'package:gogame/viewmodels/base_model.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ThankPopupView extends StatefulWidget {
  @override
  _ThankPopupViewState createState() => _ThankPopupViewState();
}

class _ThankPopupViewState extends State<ThankPopupView>
    with BaseCommonWidget, TickerProviderStateMixin {
  TextEditingController usernameController = new TextEditingController();

  TabController _tabController;

  @override
  void initState() {
    setState(() {});
    super.initState();

    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ThankPopupViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: ThankPopupViewModel(context),
      builder: (context, model, child) {
        return SafeArea(
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              SizeConfig().init(ctx, constraints);
              return _getBody(model);
            },
          ),
        );
      },
    );
  }

  Widget _getBody(ThankPopupViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(ThankPopupViewModel model) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          leading: Icon(
            Icons.menu,
            color: AppColors.white,
          ),
          title: Text(
            "Hii",
            style: TextStyle(color: AppColors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(),
        ));
  }

  Widget _currentride(DashboardViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.relativeWidth(3.65),
          vertical: SizeConfig.relativeHeight(1)),
      child: Container(
        padding: EdgeInsets.only(top: SizeConfig.relativeHeight(2)),
        height: SizeConfig.relativeHeight(13.91),
        width: SizeConfig.relativeWidth(97.10),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("INR 1000"),
                SizeConfig.horizontalSpacer(50),
                Container(
                  height: SizeConfig.relativeHeight(5),
                  width: SizeConfig.relativeWidth(20),
                  child: RaisedButton(
                    child: Text('Start'),
                    color: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {
                      model.redirectToPage(SelectCarViewRoute);
                    },
                  ),
                ),
              ],
            ),
            SizeConfig.verticalSpacer(5),
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("From"),
                SizeConfig.horizontalSpacer(40),
                Text("To")
              ],
            ),
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("Malleswaram,Bangalore"),
                SizeConfig.horizontalSpacer(10),
                Text("RR Nagar, Bangalore")
              ],
            ),
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("2:30 PM"),
                SizeConfig.horizontalSpacer(35),
                Text("9:30 PM")
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _pastride() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.65)),
      child: Container(
        padding: EdgeInsets.only(top: SizeConfig.relativeHeight(2)),
        height: SizeConfig.relativeHeight(20.91),
        width: SizeConfig.relativeWidth(97.10),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("INR 1000"),
                SizeConfig.horizontalSpacer(50),
                Text("Completed"),
              ],
            ),
            SizeConfig.verticalSpacer(5),
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("From"),
                SizeConfig.horizontalSpacer(40),
                Text("To")
              ],
            ),
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("Malleswaram,Bangalore"),
                SizeConfig.horizontalSpacer(10),
                Text("RR Nagar, Bangalore")
              ],
            ),
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("2:30 PM"),
                SizeConfig.horizontalSpacer(35),
                Text("9:30 PM")
              ],
            )
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                height: SizeConfig.relativeHeight(59.14),
                width: SizeConfig.relativeWidth(82.03),
                //color: Colors.blue.withOpacity(0.1),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Center(
                      child: Container(
                        height: SizeConfig.relativeHeight(59.14),
                        width: SizeConfig.relativeWidth(82.03),
                        padding: EdgeInsets.only(
                          left: SizeConfig.relativeWidth(4.85),
                          top: SizeConfig.relativeHeight(8.37),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
//                                SvgPicture.asset(
//                                  ImagesPaths.iconGift,
//                                  width: SizeConfig.relativeWidth(11.46),
//                                  height: SizeConfig.relativeWidth(11.46),
//                                ),
                                SizeConfig.horizontalSpacer(2),
                                Text(
                                  "Free Bonus. Free Gift.",
                                  style: TextStyle(
                                    fontFamily: AppTheme.interBold,
                                    color: AppColors.black,
                                    fontSize: SizeConfig.setSp(16.0),
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizeConfig.verticalSpacer(3.79),
//                            _getCashDetails(
//                              cash: "₹6",
//                              cashTypeText: "Deposit Cash",
//                              imageName: ImagesPaths.iconRupee,
//                              iconWidth: SizeConfig.relativeWidth(7.46),
//                              iconHeight: SizeConfig.relativeWidth(7.46),
//                            ),
                            SizeConfig.verticalSpacer(3.79),
//                            _getCashDetails(
//                              cash: "₹45",
//                              cashTypeText: "Bonus Cash",
//                              imageName: ImagesPaths.iconRupee,
//                              iconWidth: SizeConfig.relativeWidth(7.46),
//                              iconHeight: SizeConfig.relativeWidth(7.46),
//                            ),
                            SizeConfig.verticalSpacer(3.79),
//                            _getCashDetails(
//                              cash: "100",
//                              cashTypeText: "Light Coins",
//                              imageName: ImagesPaths.iconLightCoin,
//                              iconWidth: SizeConfig.relativeWidth(8.46),
//                              iconHeight: SizeConfig.relativeWidth(8.46),
//                            ),
                            SizeConfig.verticalSpacer(3.57),
                            Container(
                              width: SizeConfig.relativeWidth(62.62),
                              height: SizeConfig.relativeHeight(7.74),
//                              child: CustomButton(
//                                title: 'Accept',
//                                onTap: () {
//                                  Navigator.pop(context);
//                                },
//                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          bottom: SizeConfig.relativeHeight(53.49),
                          right: SizeConfig.relativeWidth(70.0),
//                          child: SvgPicture.asset(
//                            ImagesPaths.iconCircle,
//                            width: SizeConfig.relativeWidth(21.46),
//                            height: SizeConfig.relativeWidth(21.46),
//                          ),
                        ),
//                        Positioned(
//                          bottom: SizeConfig.relativeHeight(49.0),
//                          left: SizeConfig.relativeWidth(53.0),
//                          child: SvgPicture.asset(
//                            ImagesPaths.iconPath,
//                            width: SizeConfig.relativeWidth(33.46),
//                            height: SizeConfig.relativeWidth(33.46),
//                          ),
//                        ),
//                        Positioned(
//                          top: SizeConfig.relativeHeight(50.0),
//                          left: SizeConfig.relativeWidth(72.0),
//                          child: SvgPicture.asset(
//                            ImagesPaths.iconHexagon,
//                            width: SizeConfig.relativeWidth(22.46),
//                            height: SizeConfig.relativeWidth(22.46),
//                          ),
//                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class KYCTabCard extends StatelessWidget {
  KYCTabCard({
    @required this.imageName,
    @required this.onTap,
    @required this.showIndicator,
    @required this.title,
  });

  final Function onTap;
  final bool showIndicator;
  final String title;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeConfig.relativeHeight(6.43),
        width: SizeConfig.relativeWidth(30.66),
        decoration: BoxDecoration(
          color: showIndicator ? AppColors.orange : AppColors.white,
//          border: Border.all(
//            color: AppColors.blueColor,
//            width: 2,
//          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyShadow,
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [Color(0xff84c7fe), Color(0xffe8cdd6)],
//                      stops: [0, 1],
//                      begin: Alignment(0.83, -0.56),
//                      end: Alignment(-0.83, 0.56),
//                      // angle: 236,
//                      // scale: undefined,
//                    ),
//                    boxShadow: [
//                      BoxShadow(
//                          color: Color(0x29000000),
//                          offset: Offset(0, 1),
//                          blurRadius: 6,
//                          spreadRadius: 0),
//                    ],
//                  ),
//                  child: Image.asset(
//                    imageName,
//                    width: SizeConfig.relativeWidth(10.22),
//                    height: SizeConfig.relativeHeight(5.75),
//                  ),
                    ),
                SizeConfig.horizontalSpacer(1.94),
                Text(
                  title,
                  style: TextStyle(
                    color: showIndicator ? AppColors.white : AppColors.black,
                    fontFamily: AppTheme.interBold,
                    fontSize: SizeConfig.setSp(12),
                  ),
                )
              ],
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Container(
////                    height: SizeConfig.relativeHeight(0.44),
////                    width: SizeConfig.relativeWidth(8.04),
////                    margin: EdgeInsets.only(
////                      right: SizeConfig.relativeWidth(12.5),
////                    ),
//                  height: SizeConfig.relativeHeight(0.43),
//                  width: SizeConfig.relativeWidth(7.66),
//
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(5),
//                    color:
//                        showIndicator ? AppColors.blueColor : AppColors.white,
////                      gradient: LinearGradient(
////                          colors: showIndicator
////                              ? AppColors.blueColor
////                              : [Colors.white, Colors.white]),
//                  ),
//                ),
//              ],
//            ),
          ],
        ),
      ),
    );
  }
}
