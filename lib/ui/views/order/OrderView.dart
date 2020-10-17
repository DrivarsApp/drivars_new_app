import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/order/OrderViewModel.dart';
import 'package:gogame/ui/views/payment/PaymentViewModel.dart';
import 'package:gogame/ui/widgets/CustomButtonyellow.dart';
import 'package:gogame/ui/widgets/appDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:social_share/social_share.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with BaseCommonWidget {
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
    return ViewModelProvider<OrderViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: OrderViewModel(context),
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

  Widget _getBody(OrderViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(OrderViewModel model) {
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
        centerTitle: true,
        title: Text(
          "Ride Details ",
          style: TextStyle(
            color: AppColors.blackLight,
            fontFamily: AppTheme.interBold,
            fontStyle: FontStyle.normal,
            fontSize: SizeConfig.setSp(16.0),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              ImagesPaths.iconTicket,
//              width: SizeConfig.relativeWidth(45),
//              height: SizeConfig.relativeHeight(15),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(2.42),
          ),
          child: Column(
            children: [
              SizeConfig.verticalSpacer(2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.relativeWidth(1.72),
                ),
                width: double.infinity,
                height: SizeConfig.relativeHeight(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ride Id:",
                              style: TextStyle(
                                color: AppColors.blackLight,
                                fontFamily: AppTheme.interRegular,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.setSp(14.0),
                              ),
                            ),
                            Text(
                              "Date of Ride:",
                              style: TextStyle(
                                color: AppColors.blackLight,
                                fontFamily: AppTheme.interRegular,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.setSp(14.0),
                              ),
                            ),
                            Text(
                              "Mode of Payment:",
                              style: TextStyle(
                                color: AppColors.blackLight,
                                fontFamily: AppTheme.interRegular,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.setSp(14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DV21212212222",
                              style: TextStyle(
                                color: AppColors.blackLight,
                                fontFamily: AppTheme.interRegular,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.setSp(14.0),
                              ),
                            ),
                            Text(
                              "22nd Sep 2020",
                              style: TextStyle(
                                color: AppColors.blackLight,
                                fontFamily: AppTheme.interRegular,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.setSp(14.0),
                              ),
                            ),
                            Text(
                              "Cash",
                              style: TextStyle(
                                color: AppColors.blackLight,
                                fontFamily: AppTheme.interRegular,
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.setSp(14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text(
//                          "Ride Id:",
//                          style: TextStyle(
//                            color: AppColors.blackLight,
//                            fontFamily: AppTheme.interRegular,
//                            fontStyle: FontStyle.normal,
//                            fontSize: SizeConfig.setSp(16.0),
//                          ),
//                        ),
//                        Text(
//                          "DV21212212222",
//                          style: TextStyle(
//                            color: AppColors.blackLight,
//                            fontFamily: AppTheme.interRegular,
//                            fontStyle: FontStyle.normal,
//                            fontSize: SizeConfig.setSp(16.0),
//                          ),
//                        ),
//
//                      ],
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text(
//                          "Date of Ride:",
//                          style: TextStyle(
//                            color: AppColors.blackLight,
//                            fontFamily: AppTheme.interRegular,
//                            fontStyle: FontStyle.normal,
//                            fontSize: SizeConfig.setSp(16.0),
//                          ),
//                        ),
//                        Text(
//                          "Sep 22nd 2020, 1:31 PM",
//                          style: TextStyle(
//                            color: AppColors.blackLight,
//                            fontFamily: AppTheme.interRegular,
//                            fontStyle: FontStyle.normal,
//                            fontSize: SizeConfig.setSp(16.0),
//                          ),
//                        ),
//                        /*Expanded(
//                      child: Container(
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            Text(
//                              "Ride Id:",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Date of Ride:",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Paid By:",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                      child: Container(
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            Text(
//                              "DV21212212222",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Sep 22nd 2020, 1:31 PM",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Cash",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),*/
//                      ],
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text(
//                          "Mode of Payment:",
//                          style: TextStyle(
//                            color: AppColors.blackLight,
//                            fontFamily: AppTheme.interRegular,
//                            fontStyle: FontStyle.normal,
//                            fontSize: SizeConfig.setSp(16.0),
//                          ),
//                        ),
//                        Text(
//                          "Cash",
//                          style: TextStyle(
//                            color: AppColors.blackLight,
//                            fontFamily: AppTheme.interRegular,
//                            fontStyle: FontStyle.normal,
//                            fontSize: SizeConfig.setSp(16.0),
//                          ),
//                        ),
//                        /*Expanded(
//                      child: Container(
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            Text(
//                              "Ride Id:",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Date of Ride:",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Paid By:",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    Expanded(
//                      child: Container(
//                        child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            Text(
//                              "DV21212212222",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Sep 22nd 2020, 1:31 PM",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                            Text(
//                              "Cash",
//                              style: TextStyle(
//                                color: AppColors.blackLight,
//                                fontFamily: AppTheme.interRegular,
//                                fontStyle: FontStyle.normal,
//                                fontSize: SizeConfig.setSp(16.0),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),*/
//                      ],
//                    ),
//                  ],
//                ),
              ),
              SizeConfig.verticalSpacer(2.0),
              Container(
                width: double.infinity,
                height: SizeConfig.relativeHeight(8.87),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Fare: INR 2000",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    Container(
                      width: SizeConfig.relativeWidth(0.5),
                      height: SizeConfig.relativeHeight(4),
                      color: AppColors.black,
                    ),
                    Text(
                      "Duration: 14 Hour 12 Min",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(2.0),
              Container(
                width: double.infinity,
                height: SizeConfig.relativeHeight(11.53),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: AppColors.white,
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 45.0,
                    ),
                    title: Text(
                      "Saket Sharma ",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    subtitle: Wrap(
                      spacing: SizeConfig.relativeWidth(2),
                      children: [
                        Text(
                          "You Rated",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        SmoothStarRating(
                          borderColor: AppColors.black,
                          color: AppColors.yellow,
                          rating: 0,
                          isReadOnly: false,
                          size: SizeConfig.relativeWidth(5.53),
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: false,
                          spacing: SizeConfig.relativeWidth(0.85),
                          onRated: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizeConfig.verticalSpacer(2.0),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.relativeHeight(1.64),
                  horizontal: SizeConfig.relativeWidth(3.64),
                ),
                width: double.infinity,
                height: SizeConfig.relativeHeight(25.02),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person_pin_circle,
                          size: SizeConfig.relativeWidth(7.3),
                          color: AppColors.blackLight,
                        ),
                        SizeConfig.horizontalSpacer(6.5),
                        Expanded(
                          child: Container(
                            height: SizeConfig.relativeHeight(9.13),
                            width: SizeConfig.relativeWidth(82.63),
                            child: Neumorphic(
                              margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.relativeHeight(1.13),
                                horizontal: SizeConfig.relativeWidth(3.64),
                              ),
                              style: NeumorphicStyle(
                                color: Colors.white,
                                shadowDarkColor: Colors.black,
                                depth: NeumorphicTheme.embossDepth(context),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.relativeHeight(2),
                                horizontal: SizeConfig.relativeWidth(3.64),
                              ),
                              child: TextField(
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Please enter your Pickup Location',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.flag,
                          size: SizeConfig.relativeWidth(7.3),
                          color: AppColors.blackLight,
                        ),
                        SizeConfig.horizontalSpacer(6.5),
                        Expanded(
                          child: Container(
                            height: SizeConfig.relativeHeight(9.13),
                            width: SizeConfig.relativeWidth(82.63),
                            child: Neumorphic(
                              margin: EdgeInsets.symmetric(
                                vertical: SizeConfig.relativeHeight(1.13),
                                horizontal: SizeConfig.relativeWidth(3.64),
                              ),
                              style: NeumorphicStyle(
                                color: Colors.white,
                                shadowDarkColor: Colors.black,
                                depth: NeumorphicTheme.embossDepth(context),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: SizeConfig.relativeHeight(2),
                                horizontal: SizeConfig.relativeWidth(3.64),
                              ),
                              child: TextField(
                                //controller: _destinationController,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Please enter Destination Location',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Ride Type :",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "One Way Drop ",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "Outstation ",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RideTabs(
                    title: 'Current Ride',
                    showIndicator: model.tabSelected,
                    onTap: () {
                      model.updateTabSelected(true);
                    },
                  ),
                  RideTabs(
                    title: 'Past Ride',
                    showIndicator: !model.tabSelected,
                    onTap: () {
                      model.updateTabSelected(false);
                    },
                  ),
                ],
              ),
              SizeConfig.verticalSpacer(1.0),
              model.tabSelected ? _supportTab(model) : _invoiceTab(model),
              SizeConfig.verticalSpacer(2.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _supportTab(OrderViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.relativeHeight(1.64),
        horizontal: SizeConfig.relativeWidth(3.64),
      ),
      width: double.infinity,
      height: SizeConfig.relativeHeight(18.61),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getSupportText('Safety & Security'),
          _getSupportText('Driving Issue'),
          _getSupportText('Payments Issue'),
          _getSupportText('Other Issue')
        ],
      ),
    );
  }

  Widget _invoiceTab(OrderViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.relativeHeight(1.64),
        horizontal: SizeConfig.relativeWidth(3.64),
      ),
      width: double.infinity,
      height: SizeConfig.relativeHeight(19.81),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Base Fare",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "Night Charge",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "Insurance ",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "Total Fare",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "INR 1500.00",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "INR 100.00",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "INR 10.00",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                        Text(
                          "INR 1610.00",
                          style: TextStyle(
                            color: AppColors.blackLight,
                            fontFamily: AppTheme.interRegular,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizeConfig.verticalSpacer(1),
          Container(
            width: SizeConfig.relativeWidth(32.93),
            height: SizeConfig.relativeHeight(4.34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              color: AppColors.blackLight,
            ),
            child: Center(
              child: Text(
                'Mail Invoice',
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppTheme.interBold,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getSupportText(String supportText) {
    return Text(
      supportText,
      style: TextStyle(
        color: AppColors.blackLight,
        fontFamily: AppTheme.interRegular,
        fontStyle: FontStyle.normal,
        fontSize: SizeConfig.setSp(14.0),
      ),
    );
  }
}

class RideTabs extends StatelessWidget {
  final Function onTap;
  final bool showIndicator;
  final String title;

  const RideTabs({this.onTap, this.showIndicator, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            color: showIndicator ? AppColors.yellow : AppColors.white,
            fontFamily: AppTheme.interRegular,
            fontStyle: FontStyle.normal,
            fontSize: SizeConfig.setSp(18.0),
          ),
        ),
      ),
    );
  }
}
