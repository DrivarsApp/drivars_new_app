import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';

import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/dashboard/DashboardViewModel.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';

import 'package:gogame/ui/widgets/textfieldcustom.dart';
import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with BaseCommonWidget, TickerProviderStateMixin {
  final GlobalKey scaffoldKey = GlobalKey();
  TextEditingController _pickupLocationController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  TabController _tabController;

  /// Initialize dropdown menu

  String _value = 'one';

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
    return ViewModelProvider<DashboardViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: DashboardViewModel(context),
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

  Widget _getBody(DashboardViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(DashboardViewModel model) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.yellow,
        titleSpacing: 100.5,
        title: InkWell(
          onTap: _SelectCityshowModalSheet,
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new DropdownButton<String>(
                    value: _value,
                    items: <DropdownMenuItem<String>>[
                      new DropdownMenuItem(
                        child: new Text('one'),
                        value: 'one',
                      ),
                      new DropdownMenuItem(
                          child: new Text('two'), value: 'two'),
                    ],
                    onChanged: (String value) {
                      setState(() => _value = value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
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
            onPressed: () {
              _showModalSheetTournament();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          //  padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawerHeader(model),
            //Divider(),
            createDrawerBodyItem(
              icon: Icons.home,
              text: 'Book Ride',
              onTap: () {
                model.redirectToPage(BookRideViewRoute);
              },
            ),
            createDrawerBodyItem(
                icon: Icons.directions_car, text: 'My Drivers'),
            createDrawerBodyItem(
              icon: Icons.credit_card,
              text: 'Payments',
              onTap: () {
                Navigator.pop(context);
                model.redirectToPage(PaymentViewRoute);
              },
            ),
            //Divider(),
            createDrawerBodyItem(
              icon: Icons.notifications_active,
              text: 'Refer & Earn',
              onTap: () {
                Navigator.pop(context);
                model.redirectToPage(ReferViewRoute);
              },
            ),
            Divider(),
            createDrawerBodyItem(icon: Icons.help, text: 'Help'),
            createDrawerBodyItem(icon: Icons.contact_phone, text: 'Policies'),
            createDrawerBodyItem(
                icon: Icons.supervised_user_circle, text: 'About us'),
            createDrawerBodyItem(icon: Icons.exit_to_app, text: 'Logout'),
            SizeConfig.verticalSpacer(20),
            ListTile(
              title: Align(
                alignment: Alignment.bottomRight,
                child: Text('V 1.0.0'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(2.42),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeConfig.verticalSpacer(1.60),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.relativeHeight(1),
                  horizontal: SizeConfig.relativeWidth(3.64),
                ),
                width: double.infinity,
                height: SizeConfig.relativeHeight(11.90),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select ride type ",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interBold,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(16.0),
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: SizeConfig.relativeWidth(36.93),
                          height: SizeConfig.relativeHeight(4.94),
                          child: CustomButton(
                            title: 'One Way',
                            onPress: () {
                              _showModalSheetTournament();
                            },
                          ),
                        ),
                        Container(
                          width: SizeConfig.relativeWidth(36.93),
                          height: SizeConfig.relativeHeight(4.94),
                          child: CustomButton(
                            title: 'Round Trip',
                            onPress: () {
                              _SelectCityshowModalSheet();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(3.09),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.relativeHeight(1.64),
                  horizontal: SizeConfig.relativeWidth(3.64),
                ),
                width: double.infinity,
                height: SizeConfig.relativeHeight(23.02),
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
                                controller: _pickupLocationController,
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
                                controller: _destinationController,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Please enter Destination Location',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(1.60),
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
              SizeConfig.verticalSpacer(1.60),
              model.tabSelected ? _currentRideTab(model) : _pastRideTab(model),
              SizeConfig.verticalSpacer(1.60),
              _package(model),
              SizeConfig.verticalSpacer(1.60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentRideTab(DashboardViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.relativeHeight(1.64),
        //horizontal: SizeConfig.relativeWidth(3.64),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "One way",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
              Text(
                "Outstation",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
              Text(
                "INR",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.greyDarkColor,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_pin_circle,
                      size: SizeConfig.relativeWidth(7.3),
                    ),
                    Icon(
                      Icons.flag,
                      size: SizeConfig.relativeWidth(7.3),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RR Nagar Bangalore Karnataka",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.3),
                    Text(
                      "Arjun Beach Goa",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "18-Sep-2020",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.3),
                    Text(
                      "12:54 AM",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
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
        ],
      ),
    );
  }

  Widget _pastRideTab(DashboardViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.relativeHeight(1.64),
        //horizontal: SizeConfig.relativeWidth(3.64),
      ),
      width: double.infinity,
      height: SizeConfig.relativeHeight(18.61),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "One way",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
              Text(
                "Outstation",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
              Text(
                "INR",
                style: TextStyle(
                  color: AppColors.greyDarkColor,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(14.0),
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.greyDarkColor,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_pin_circle,
                      size: SizeConfig.relativeWidth(7.3),
                    ),
                    Icon(
                      Icons.flag,
                      size: SizeConfig.relativeWidth(7.3),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "RR Nagar Bangalore Karnataka",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.3),
                    Text(
                      "Arjun Beach Goa",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "18-Sep-2020",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(14.0),
                      ),
                    ),
                    SizeConfig.verticalSpacer(1.3),
                    Text(
                      "19-Sep-2020",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
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
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              Icon(
//                Icons.person_pin_circle,
//                size: SizeConfig.relativeWidth(7.3),
//                color: AppColors.blackLight,
//              ),
//              Text(
//                "RR Nagar Bangalore Karnataka",
//                style: TextStyle(
//                  color: AppColors.greyDarkColor,
//                  fontFamily: AppTheme.interRegular,
//                  fontStyle: FontStyle.normal,
//                  fontSize: SizeConfig.setSp(14.0),
//                ),
//              ),
//              Text(
//                "18-Sep-2020",
//                style: TextStyle(
//                  color: AppColors.greyDarkColor,
//                  fontFamily: AppTheme.interRegular,
//                  fontStyle: FontStyle.normal,
//                  fontSize: SizeConfig.setSp(14.0),
//                ),
//              ),
//            ],
//          ),
//          SizeConfig.verticalSpacer(1),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              Icon(
//                Icons.person_pin_circle,
//                size: SizeConfig.relativeWidth(7.3),
//                color: AppColors.blackLight,
//              ),
//              Text(
//                "RR Nagar Bangalore Karnataka",
//                style: TextStyle(
//                  color: AppColors.greyDarkColor,
//                  fontFamily: AppTheme.interRegular,
//                  fontStyle: FontStyle.normal,
//                  fontSize: SizeConfig.setSp(14.0),
//                ),
//              ),
//              Text(
//                "12:54 AM",
//                style: TextStyle(
//                  color: AppColors.greyDarkColor,
//                  fontFamily: AppTheme.interRegular,
//                  fontStyle: FontStyle.normal,
//                  fontSize: SizeConfig.setSp(14.0),
//                ),
//              ),
//            ],
//          ),
        ],
      ),
    );
  }

  Widget _package(DashboardViewModel model) {
    return Container(
      width: double.infinity,
      height: SizeConfig.relativeHeight(23.18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: SizeConfig.relativeWidth(31.37),
            height: SizeConfig.relativeHeight(15.91),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.walletOutline,
                  color: AppColors.white,
                  size: SizeConfig.relativeWidth(10.3),
                ),
                Text(
                  "INR 500.00",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppTheme.interRegular,
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.setSp(18.0),
                  ),
                ),
                Text(
                  "Driver Wallet ",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppTheme.interRegular,
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.setSp(14.0),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: SizeConfig.relativeWidth(31.37),
            height: SizeConfig.relativeHeight(15.91),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  MdiIcons.cubeOutline,
                  color: AppColors.white,
                  size: SizeConfig.relativeWidth(10.3),
                ),
                Text(
                  "Packages",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppTheme.interRegular,
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.setSp(18.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          SizeConfig.horizontalSpacer(4.5),
          Text(
            text,
            style: TextStyle(
              color: AppColors.greyDarkColor,
              fontFamily: AppTheme.interRegular,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.setSp(18.0),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader(model) {
    return Container(
      height: SizeConfig.relativeHeight(15.45),
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 35,
                ),
              ),
              SizeConfig.verticalSpacer(4),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      model.redirectToPage(ProfileViewRoute);
                    },
                    child: Text(
                      "jyoti sharma",
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(18.0),
                      ),
                    ),
                  ),
                  Text(
                    "+91 7805977569",
                    style: TextStyle(
                      color: AppColors.greyDarkColor,
                      fontFamily: AppTheme.interRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showModalSheetTournament() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (builder) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.relativeWidth(3.88),
              vertical: SizeConfig.relativeHeight(2.29),
            ),
            child: Column(
              children: [
                Container(
                  width: SizeConfig.relativeWidth(91.47),
                  height: SizeConfig.relativeHeight(19.97),
                  padding: EdgeInsets.only(
                    left: SizeConfig.relativeWidth(2.42),
                    top: SizeConfig.relativeHeight(1.37),
                  ),
                  decoration: BoxDecoration(
                    color: Hexcolor("#ffc100"),
//                    border: Border.all(
//                      color: AppColors.black,
//                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            size: SizeConfig.relativeSize(30),
                          ),
                          SizeConfig.horizontalSpacer(6.31),
                          Column(
                            children: [
                              SizeConfig.verticalSpacer(1.71),
                              Text("One Way - In-city",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: SizeConfig.setSp(22))),
                              SizeConfig.verticalSpacer(1.71),
                              Text(
                                  "I will go with in city driver will  drop me with in city  ",
                                  style: const TextStyle(
                                      color: const Color(0xff555555),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizeConfig.verticalSpacer(1.60),
                Container(
                  width: SizeConfig.relativeWidth(91.47),
                  height: SizeConfig.relativeHeight(19.67),
                  padding: EdgeInsets.only(
                    left: SizeConfig.relativeWidth(2.42),
                    right: SizeConfig.relativeWidth(3.39),
                    top: SizeConfig.relativeHeight(1.26),
                  ),
                  decoration: BoxDecoration(
                    color: Hexcolor("#ffc100"),
//                    border: Border.all(
//                      color: AppColors.black,
//                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              size: SizeConfig.relativeSize(30),
                            ),
                            SizeConfig.horizontalSpacer(6.31),
                            Column(
                              children: [
                                SizeConfig.verticalSpacer(1.71),
                                Text("One Way - In-city",
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontFamily: AppTheme.interBold,
                                        fontStyle: FontStyle.normal,
                                        fontSize: SizeConfig.setSp(22))),
                                SizeConfig.verticalSpacer(1.71),
                                Text(
                                    "I will go with in city driver will  drop me with in city  ",
                                    style: const TextStyle(
                                        color: const Color(0xff555555),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Roboto",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.0))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _SelectCityshowModalSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        context: context,
        builder: (builder) {
          return GridView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int innerIndex) {
              return Container(
                padding: EdgeInsets.all(3),
                child: InkWell(
                  onTap: () {
                    // model.redirectToPage(GameViewRoute);
                  },
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: double.infinity,
                        width: SizeConfig.relativeWidth(28.67),
                        //  width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.greyShadow,
                              offset: Offset(0, 0),
                              blurRadius: 6,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            errorWidget: (context, val, _) {
                              return CachedNetworkImage(
                                imageUrl: ImageNetwork.gamePlaceholderImage,
                              );
                            },
                            fit: BoxFit.fill,
                            imageUrl: ImageNetwork.desertImage,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: SizeConfig.relativeWidth(2.45),
                          bottom: SizeConfig.relativeHeight(1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "SteppyFeet",
                              style: TextStyle(
                                fontFamily: AppTheme.interBold,
                                color: AppColors.white,
                                fontSize: SizeConfig.setSp(16.0),
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            Text(
                              "Funny • Sizzle • Dank",
                              style: TextStyle(
                                fontFamily: AppTheme.interRegular,
                                color: AppColors.white,
                                fontSize: SizeConfig.setSp(12.0),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
//        return Container(
//          padding: EdgeInsets.all(5),
//          child: InkWell(
//            onTap: () {
//              //  model.redirectToPage(GameViewRoute);
//            },
//            child: Stack(
//              overflow: Overflow.visible,
//              children: [
//                Container(
//                  height: double.infinity,
//                  width: double.infinity,
//                  decoration: BoxDecoration(
//                    boxShadow: [
//                      BoxShadow(
//                        color: AppColors.greyShadow,
//                        offset: Offset(0, 0),
//                        blurRadius: 6,
//                        spreadRadius: 0,
//                      ),
//                    ],
//                  ),
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.circular(10.0),
//                    child: CachedNetworkImage(
//                      errorWidget: (context, val, _) {
//                        return CachedNetworkImage(
//                          imageUrl: ImageNetwork.gamePlaceholderImage,
//                        );
//                      },
//                      fit: BoxFit.fill,
//                      imageUrl: ImageNetwork.desertImage,
//                    ),
//                  ),
//                ),
//                Container(
//                  padding: EdgeInsets.only(
//                    left: SizeConfig.relativeWidth(2.45),
//                    bottom: SizeConfig.relativeHeight(1.5),
//                  ),
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Expanded(
//                        child: Container(),
//                      ),
//                      Text(
//                        "SteppyFeet",
//                        style: TextStyle(
//                          fontFamily: AppTheme.interBold,
//                          color: AppColors.white,
//                          fontSize: SizeConfig.setSp(16.0),
//                          fontStyle: FontStyle.normal,
//                        ),
//                      ),
//                      Text(
//                        "Funny • Sizzle • Dank",
//                        style: TextStyle(
//                          fontFamily: AppTheme.interRegular,
//                          color: AppColors.white,
//                          fontSize: SizeConfig.setSp(12.0),
//                          fontWeight: FontWeight.w400,
//                          fontStyle: FontStyle.normal,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        );

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
