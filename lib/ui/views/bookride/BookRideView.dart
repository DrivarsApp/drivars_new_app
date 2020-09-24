import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
import 'package:gogame/ui/views/bookride/BookRideProvider.dart';

import 'package:gogame/ui/views/bookride/BookRideViewModel.dart';

import 'package:gogame/utils.dart';

import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class BookRideView extends StatefulWidget {
  @override
  _BookRideViewState createState() => _BookRideViewState();
}

class _BookRideViewState extends State<BookRideView>
    with BaseCommonWidget, TickerProviderStateMixin {
  TextEditingController usernameController = new TextEditingController();

  TabController _tabController;

  final String _dateFormat = "dd/MM/yyyy HH:mm";
  int _currentIndex = 0;

  List cardList = [
    Item1(),
    Item2(),
    Item3(),
    Item4(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
    return ViewModelProvider<BookRideViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: BookRideViewModel(context),
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

  Widget _getBody(BookRideViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(BookRideViewModel model) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.yellow,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            MdiIcons.viewDashboardOutline,
            size: SizeConfig.relativeWidth(7.3),
            color: AppColors.white,
          ),
        ),
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
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Hexcolor('#205cbe'),
            ),
            child: Column(children: [
              SizeConfig.verticalSpacer(2.17),
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
                                //controller: _pickupLocationController,
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
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(2.17),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  //  autoPlay: true,
                  //  autoPlayInterval: Duration(seconds: 3),
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.white,
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(
                  cardList,
                  (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index ? Colors.white : Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.relativeWidth(3.45)),
                child: Consumer<BookRideProvider>(
                  builder: (BuildContext context, BookRideProvider value,
                      Widget child) {
                    return Container(
                      height: SizeConfig.relativeHeight(6.86),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2023, 1, 12),
                            onChanged: (date) {
                              Utility.convertDateToString(
                                  date: date, expectedFormat: _dateFormat);
//                              model.updateDateTimeValue(date.toString());
                            },
                            onConfirm: (date) {
                              model.updateDateTimeValue(date.toString());
                            },
                            currentTime: DateTime.now(),
                            locale: LocaleType.en,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.calendar_today),
                            Consumer<BookRideProvider>(
                              builder: (BuildContext context,
                                  BookRideProvider value, Widget child) {
                                return Text(
                                  value.dateTimeValue == null
                                      ? 'Pick Date and Time'
                                      : value.dateTimeValue,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontFamily: AppTheme.interBold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: SizeConfig.setSp(14),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizeConfig.verticalSpacer(2.15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.relativeWidth(3.45),
                ),
                child: Container(
                    height: SizeConfig.relativeHeight(17.86),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            ImagesPaths.iconCalculate,
                            width: SizeConfig.relativeWidth(9.86),
                            height: SizeConfig.relativeHeight(15.37),
                          ),
                          Column(
                            children: [
                              SizeConfig.verticalSpacer(4.94),
                              Text("Estimated Fare",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: SizeConfig.setSp(18))),
                              SizeConfig.verticalSpacer(1.03),
                              Text(
                                "INR 1500 + GST",
                                style: TextStyle(
                                  color: AppColors.lighttext,
                                  fontFamily: AppTheme.interBold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: SizeConfig.setSp(24),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              SizeConfig.verticalSpacer(2.14),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.relativeWidth(6.14)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonCustom(
                      // imageName: ImagesPaths.iconPANCard,
                      title: 'Back',
                      showIndicator: model.cashSelected,
                      onTap: () {},
                    ),
                    ButtonCustom(
                      title: 'Book Now ',
                      showIndicator: !model.cashSelected,
                      onTap: () {
                        _NotoutstaionshowModalSheetTournament(model);
                        //  _showModalSheetTournament();
                      },
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  void _NotoutstaionshowModalSheetTournament(model) {
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
                SizeConfig.verticalSpacer(1.60),
                Text("Note for Outstation Trips ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: AppTheme.interBold,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(20))),
                SizeConfig.verticalSpacer(2.10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "1. Driver will drive car max 12 hour in a \n   day",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppTheme.interRegular,
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.setSp(16))),
                ),
                SizeConfig.verticalSpacer(2.45),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      " 2. Food will be provided by customer for\n     outstation rides ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppTheme.interRegular,
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.setSp(16))),
                ),
                SizeConfig.verticalSpacer(2.45),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                      "3. Accomodation will be provided by     \n    customer  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppTheme.interRegular,
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.setSp(16))),
                ),
                SizeConfig.verticalSpacer(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonCustom(
                      // imageName: ImagesPaths.iconPANCard,
                      title: 'Cancel',

                      showIndicator: !model.cashSelected,
                      onTap: () {},
                    ),
                    ButtonCustom(
                      title: 'Confirm',
                      showIndicator: model.cashSelected,
                      onTap: () {
                        Navigator.pop(context);
                        _showDialog();

                        // model.redirectToPage(ThankPopupViewRoute);
                        //  _showModalSheetTournament();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SvgPicture.asset(
                    ImagesPaths.iconAppreciation,
                    width: SizeConfig.relativeWidth(25.86),
                    height: SizeConfig.relativeHeight(35.37),
                  ),
                  Text(
                      "Thank you for booking with us  Our team will contact you soon.",
                      style: TextStyle(
                          color: AppColors.black,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.setSp(16)))
                ],
              )),
//          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Align(
              alignment: Alignment.center,
              child: FlatButton(
                child: Text("Go to Home ",
                    style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(22))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

//  void _NotoutstaionshowModalSheetTournament() {
//    showModalBottomSheet(
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.only(
//          topLeft: Radius.circular(10.0),
//          topRight: Radius.circular(10.0),
//        ),
//      ),
//      builder: (builder) {
//        return SingleChildScrollView(
//          child: Container(
//            padding: EdgeInsets.symmetric(
//              horizontal: SizeConfig.relativeWidth(3.88),
//              vertical: SizeConfig.relativeHeight(2.29),
//            ),
//            child: Column(
//              children: [
//                Text("Note for Outstation Trips ",
//                    style: const TextStyle(
//                        color: const Color(0xff555555),
//                        fontWeight: FontWeight.w400,
//                        fontFamily: "Roboto",
//                        fontStyle: FontStyle.normal,
//                        fontSize: 18.0)),
//                SizeConfig.verticalSpacer(1.60),
//                Align(
//                  alignment: Alignment.center,
//                  child: Text("1. Driver will drive car max 12 hour in a day",
//                      style: TextStyle(
//                          color: Color(0xff555555),
//                          fontFamily: "Roboto",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 18.0)),
//                ),
//                SizeConfig.verticalSpacer(2.45),
//                Align(
//                  alignment: Alignment.center,
//                  child: Text(
//                      "2. Food will be provided by customer for\n   outstation rides ",
//                      style: const TextStyle(
//                          color: const Color(0xff555555),
//                          fontWeight: FontWeight.w400,
//                          fontFamily: "Roboto",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 18.0)),
//                ),
//                SizeConfig.verticalSpacer(2.45),
//                Align(
//                  alignment: Alignment.center,
//                  child: Text(
//                      "3. Accomodation will be provided by\n  customer  ",
//                      style: const TextStyle(
//                          color: const Color(0xff555555),
//                          fontWeight: FontWeight.w400,
//                          fontFamily: "Roboto",
//                          fontStyle: FontStyle.normal,
//                          fontSize: 18.0)),
//                ),
//              ],
//            ),
//          ),
//        );
//      },
//    );
//  }
}

class Item1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            MdiIcons.car,
            size: SizeConfig.relativeSize(30),
          ),
//          SvgPicture.asset(
//            ImagesPaths.iconHatchBackCar,
//            width: SizeConfig.relativeWidth(9.86),
//            height: SizeConfig.relativeHeight(10.37),
//          ),
          //Icon(MdiIcons.car,size: SizeConfig.relativeSize(20),),
          Text("Small Car  / Hatchback ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
          SizeConfig.verticalSpacer(2),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.grey,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Select Car",
              ),
            ),
          ),

//          ButtonCustom(
//            // imageName: ImagesPaths.iconPANCard,
//            title: 'Select Car',
//            // showIndicator: model.cashSelected,
//            onTap: () {
////                               model.menuSelected(true);
//              // model.redirectToPage(BookRideViewRoute);
//            },
//          ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            MdiIcons.car,
            size: SizeConfig.relativeSize(30),
          ),
//          SvgPicture.asset(
//            ImagesPaths.iconHatchBackCar,
//            width: SizeConfig.relativeWidth(9.86),
//            height: SizeConfig.relativeHeight(10.37),
//          ),
          //Icon(MdiIcons.car,size: SizeConfig.relativeSize(20),),
          Text("Small Car  / Hatchback ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
          SizeConfig.verticalSpacer(2),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.grey,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Select Car",
              ),
            ),
          ),

//          ButtonCustom(
//            // imageName: ImagesPaths.iconPANCard,
//            title: 'Select Car',
//            // showIndicator: model.cashSelected,
//            onTap: () {
////                               model.menuSelected(true);
//              // model.redirectToPage(BookRideViewRoute);
//            },
//          ),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            MdiIcons.car,
            size: SizeConfig.relativeSize(30),
          ),
//          SvgPicture.asset(
//            ImagesPaths.iconSedan,
//            width: SizeConfig.relativeWidth(9.86),
//            height: SizeConfig.relativeHeight(10.37),
//          ),
          //Icon(MdiIcons.car,size: SizeConfig.relativeSize(20),),
          Text("Small Car  / Hatchback ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
          SizeConfig.verticalSpacer(2),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.grey,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Select Car",
              ),
            ),
          ),

//          ButtonCustom(
//            // imageName: ImagesPaths.iconPANCard,
//            title: 'Select Car',
//            // showIndicator: model.cashSelected,
//            onTap: () {
////                               model.menuSelected(true);
//              // model.redirectToPage(BookRideViewRoute);
//            },
//          ),
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            MdiIcons.car,
            size: SizeConfig.relativeSize(30),
          ),
//          SvgPicture.asset(
//            ImagesPaths.iconSedan,
//            width: SizeConfig.relativeWidth(9.86),
//            height: SizeConfig.relativeHeight(10.37),
//          ),
          //Icon(MdiIcons.car,size: SizeConfig.relativeSize(20),),
          Text(
            "Small Car  / Hatchback ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w600),
          ),
          SizeConfig.verticalSpacer(2),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Colors.grey,
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                "Select Car",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  ButtonCustom({
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
        height: SizeConfig.relativeHeight(7.0),
        width: SizeConfig.relativeWidth(40.55),
        decoration: BoxDecoration(
          color: showIndicator ? Colors.yellow : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(),
                SizeConfig.horizontalSpacer(1.94),
                Text(
                  title,
                  style: TextStyle(
                    color: showIndicator ? AppColors.black : AppColors.white,
                    fontFamily: AppTheme.interBold,
                    fontSize: SizeConfig.setSp(16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
