import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flushbar/flushbar.dart';
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
import 'package:gogame/ui/views/dashboard/DashboardViewModel.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomBorderButton.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:gogame/ui/widgets/PickupdropContainer.dart';
import 'package:gogame/ui/widgets/PickupdropfilledContainer.dart';

import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;

class SelectTimeView extends StatefulWidget {
  @override
  _SelectTimeViewState createState() => _SelectTimeViewState();
}

class _SelectTimeViewState extends State<SelectTimeView> with BaseCommonWidget,TickerProviderStateMixin {
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
    return ViewModelProvider<SelectTimeViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: SelectTimeViewModel(context),
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

  Widget _getBody(SelectTimeViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(SelectTimeViewModel model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#3E4E87'),
        leading: Icon(Icons.menu,color:AppColors.white,),
        title: Text("Hii",style: TextStyle(color: AppColors.white),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizeConfig.verticalSpacer(2.15),
        Center(
          child:
          Pickup(),
        ),
            SizeConfig.verticalSpacer(2),
            Container(
              height: SizeConfig.relativeHeight(80),
              width: SizeConfig.relativeWidth(87.10),
              decoration: BoxDecoration(
                color: Hexcolor('#3E4E87'),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(4),
                            vertical: SizeConfig.relativeHeight(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: SizeConfig.relativeHeight(10.91),
                              width: SizeConfig.relativeWidth(37.10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.car,size: SizeConfig.relativeSize(25),color: AppColors.black,),
                                  SizeConfig.verticalSpacer(1.85),
                                  Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                ],
                              ),
                            ),
                            SizeConfig.horizontalSpacer(4),
                            Container(
                              height: SizeConfig.relativeHeight(10.91),
                              width: SizeConfig.relativeWidth(37.10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.car,size: SizeConfig.relativeSize(25),color: AppColors.black,),
                                  SizeConfig.verticalSpacer(1.85),
                                  Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(4),
                            vertical: SizeConfig.relativeHeight(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: SizeConfig.relativeHeight(15.91),
                              width: SizeConfig.relativeWidth(37.10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.car,size: SizeConfig.relativeSize(25),color: AppColors.black,),
                                  SizeConfig.verticalSpacer(1.85),
                                  Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                ],
                              ),
                            ),
                            SizeConfig.horizontalSpacer(4),
                            Container(
                              height: SizeConfig.relativeHeight(15.91),
                              width: SizeConfig.relativeWidth(37.10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.car,size: SizeConfig.relativeSize(25),color: AppColors.black,),
                                  SizeConfig.verticalSpacer(1.85),
                                  Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(4),
                            vertical: SizeConfig.relativeHeight(2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: SizeConfig.relativeHeight(15.91),
                              width: SizeConfig.relativeWidth(37.10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.car,size: SizeConfig.relativeSize(25),color: AppColors.black,),
                                  SizeConfig.verticalSpacer(1.85),
                                  Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                ],
                              ),
                            ),
                            SizeConfig.horizontalSpacer(4),
                            Container(
                              height: SizeConfig.relativeHeight(15.91),
                              width: SizeConfig.relativeWidth(37.10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(MdiIcons.car,size: SizeConfig.relativeSize(25),color: AppColors.black,),
                                  SizeConfig.verticalSpacer(1.85),
                                  Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.black,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),

                  Row(
                    children: [
                      SizeConfig.horizontalSpacer(5.15),
                      Container(
                        height: SizeConfig.relativeHeight(4.89),
                        width: SizeConfig.relativeWidth(20.40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.greyShadow
                        ),
                        child: CustomButton(
                          title: 'Manual',
                          onPress: () {},
                        ),
                      ),
                      SizeConfig.horizontalSpacer(20.9),
                      Container(
                        height: SizeConfig.relativeHeight(4.89),
                        width: SizeConfig.relativeWidth(25.40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.yellow[700],
                        ),
                        child: CustomButton(
                          title: 'Automatic',
                          onPress: () {
                            model.redirectToPage(SelectTimeViewRoute);
                          },
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),












//    appBar: AppBar(
//        elevation: 0,
//        centerTitle: true,
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//          title: Text("Hello"),
//        actions: <Widget>[
//
//                    Container(
//            padding: EdgeInsets.only(
//              top: SizeConfig.relativeHeight(2),
//              bottom: SizeConfig.relativeHeight(2),
//              right: SizeConfig.relativeWidth(3.64),
//            ),
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(5.0),
//              child: Container(
//                width: SizeConfig.relativeWidth(10.74),
//                height: SizeConfig.relativeWidth(5.74),
//                child: CachedNetworkImage(
//                  imageUrl: ImageNetwork.desertImage,
//                  fit: BoxFit.fill,
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//      drawer: Container(
//        width: SizeConfig.screenWidth * 0.90,
//        child: Drawer(
//          child: _appDrawer(model),
//        ),
//      ),
//      bottomNavigationBar:
//      BottomNavigationBar(
//        backgroundColor: AppColors.blueColor,
//        currentIndex: _currentIndex,
//        type: BottomNavigationBarType.fixed,
//        items: [
//          BottomNavigationBarItem(
//            icon: SvgPicture.asset(
//              ImagesPaths.iconDashboardMenu,
//            ),
//            title: Text(''),
//            backgroundColor: AppColors.blueColor,
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.notifications),
//            title: Text(''),
//            backgroundColor: AppColors.blueColor,
//          )
//        ],
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//      ),
//          BottomAppBar(
//        color: AppColors.blueColor,
//        child: Container(
//          height: SizeConfig.relativeHeight(6.43),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              SvgPicture.asset(
//                ImagesPaths.iconDashboardMenu,
//              ),
//              IconButton(
//                icon: Icon(Icons.notifications),
//                onPressed: () {
//                  model.redirectToPage(NotificationViewRoute);
//                },
//                color: AppColors.white.withOpacity(0.5),
//              )
//            ],
//          ),
//        ),
//      ),

//      body: SingleChildScrollView(
//        child: Column(
//          children: [
//            SizeConfig.verticalSpacer(2.15),
//            Container(
//              height: SizeConfig.relativeHeight(17.91),
//              width: SizeConfig.relativeWidth(87.10),
//              padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.64)),
//              decoration: BoxDecoration(
//                color: Colors.blueGrey,
//                borderRadius:BorderRadius.circular(8)
//              ),
////              child: Column(
////                children: [
////                  SizeConfig.verticalSpacer(2.5),
////                  Row(
////                    children: [
////                      SizeConfig.horizontalSpacer(5.15),
////                      Container(
////                        height: SizeConfig.relativeHeight(4.89),
////                        width: SizeConfig.relativeWidth(20.40),
////                        decoration: BoxDecoration(
////                          borderRadius: BorderRadius.circular(5),
////                          color: Colors.yellow
////                        ),
////                        child: CustomButton(
////                          title: 'One Way',
////                          onPress: () {},
////                        ),
////                      ),
////                      SizeConfig.horizontalSpacer(22.9),
////                      Container(
////                        height: SizeConfig.relativeHeight(4.89),
////                        width: SizeConfig.relativeWidth(25.40),
////                        decoration: BoxDecoration(
////                            borderRadius: BorderRadius.circular(5),
////                          color: Colors.yellow,
////                        ),
////                        child: CustomButton(
////                          title: 'Round Trip',
////                          onPress: () {
////                            model.redirectToPage(SelectCarViewRoute);
////                          },
////                        ),
////                      ),
////
////                    ],
////                  ),
////                 SizeConfig.verticalSpacer(1.5),
//////                  Row(
//////                   children: [
//////                     SizeConfig.horizontalSpacer(15.15),
//////                     Icon(Icons.location_on),
//////                     SizeConfig.horizontalSpacer(20.15),
//////                    Text("Hello")
//////                   ],
//////                  ),
//////                  Row(
//////                    children: [
//////                      Icon(Icons.location_on),
//////                      Text("Hello"),
//////                    ],
//////                  )
////                ],
////              ),
//
//
//
//            ),
//            TabBar(
//              controller: _tabController,
//              labelColor: AppColors.black,
//              labelStyle: TextStyle(
//                fontSize: SizeConfig.setSp(12),
//                fontFamily: AppTheme.interBold,
//              ),
//              indicatorColor: AppColors.gradientBlue,
//              indicatorPadding: EdgeInsets.zero,
//              indicatorWeight: 2.0,
//              indicatorSize:  TabBarIndicatorSize.label,
//              labelPadding: EdgeInsets.zero,
//              tabs: [
//                Tab(
//                  child: Text(
//                    'Current Ride',
//                    maxLines: 1,
//                    softWrap: true,
//                    style: TextStyle(
//                      color: AppColors.black,
//                      fontSize: SizeConfig.setSp(16),
//                      fontFamily: AppTheme.interBold,
//                    ),
//                  ),
//                ),
//                Tab(
//                  child: Text(
//                    'Past Rides',
//                    maxLines: 1,
//                    softWrap: true,
//                    style: TextStyle(
//                      color: AppColors.black,
//                      fontSize: SizeConfig.setSp(16),
//                      fontFamily: AppTheme.interBold,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//            SizeConfig.verticalSpacer(1.15),
//            Container(
//              height: SizeConfig.screenHeight * 0.20,
//              width: SizeConfig.screenWidth * 0.87,
//              child: TabBarView(
//                controller: _tabController,
//                children: [
//                  _currentride(model),
//                  _currentride(model),
//                //  _listTabLeaderBoard(model),
//                ],
//              ),
//            ),
//            SizeConfig.verticalSpacer(2.3),
//
//
////
//        Container(
//          padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(5.5)),
//          child: Row(
//            children: [
//              Container(
//                    height: SizeConfig.relativeHeight(15.91),
//                    width: SizeConfig.relativeWidth(42.10),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(10),
//                      color: Colors.blueGrey
//                    ),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
//                            fontSize: SizeConfig.setSp(16),
//                            fontFamily: AppTheme.interBold),
//                            ),
//                        SizeConfig.verticalSpacer(1.85),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Text("INR 200.",style: TextStyle(
//                                fontSize: SizeConfig.setSp(16),
//                                fontFamily: AppTheme.interBold),
//                                ),
//                            Icon(MdiIcons.walletOutline,size: SizeConfig.relativeSize(17),)
//                          ],
//                        )
//                      ],
//                    ),
//                  ),
//              SizeConfig.horizontalSpacer(3.5),
//              Container(
//                height: SizeConfig.relativeHeight(15.91),
//                width: SizeConfig.relativeWidth(42.10),
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10),
//                    color: Colors.blueGrey
//                ),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
//                        fontSize: SizeConfig.setSp(16),
//                        fontFamily: AppTheme.interBold),
//                    ),
//                    SizeConfig.verticalSpacer(1.85),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Text("INR 200.",style: TextStyle(
//                            fontSize: SizeConfig.setSp(16),
//                            fontFamily: AppTheme.interBold),
//                        ),
//                        Icon(MdiIcons.walletOutline,size: SizeConfig.relativeSize(17),)
//                      ],
//                    )
//                  ],
//                ),
//              ),
//
//
//            ],
//          ),
//        )
//
//
//
////         Row(
////                mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                children: [
////                  Container(
////                    height: SizeConfig.relativeHeight(15.91),
////                    width: SizeConfig.relativeWidth(42.10),
////                    decoration: BoxDecoration(
////                      borderRadius: BorderRadius.circular(10),
////                      color: Colors.blueGrey
////                    ),
////                    child: Column(
////                      mainAxisAlignment: MainAxisAlignment.center,
////                      children: [
////                        Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
////                            fontSize: SizeConfig.setSp(16),
////                            fontFamily: AppTheme.interBold),
////                            ),
////                        SizeConfig.verticalSpacer(1.85),
////                        Row(
////                          mainAxisAlignment: MainAxisAlignment.center,
////                          children: [
////                            Text("INR 200.",style: TextStyle(
////                                fontSize: SizeConfig.setSp(16),
////                                fontFamily: AppTheme.interBold),
////                                ),
////                            Icon(MdiIcons.walletOutline,size: SizeConfig.relativeSize(17),)
////                          ],
////                        )
////                      ],
////                    ),
////                  ),
////
////                  Container(
////                    height: SizeConfig.relativeHeight(15.91),
////                    width: SizeConfig.relativeWidth(42.10),
////                    padding: EdgeInsets.only(
////                      left: SizeConfig.relativeWidth(4.85),
////                    ),
////                    decoration: BoxDecoration(
////                        borderRadius: BorderRadius.circular(10),
////                        color: Colors.blueGrey
////                    ),
////                    child: Column(
////                      mainAxisAlignment: MainAxisAlignment.center,
////                      children: [
////                        Text("Driver Package",style: TextStyle(
////                            fontSize: SizeConfig.setSp(16),
////                            fontFamily: AppTheme.interBold),
////                        ),
////                        SizeConfig.verticalSpacer(1.14),
////                        Icon(MdiIcons.walletOutline,size: SizeConfig.relativeSize(25),)
////                      ],
////                    ),
////                  ),
////                  SizeConfig.horizontalSpacer(4.85)
////                ],
////              ),
//            ])


//        ),

      );

  }


  Widget _currentride(DashboardViewModel model){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.65),
      vertical: SizeConfig.relativeHeight(1)),
      child: Container(
        padding: EdgeInsets.only(top: SizeConfig.relativeHeight(2)),
        height: SizeConfig.relativeHeight(13.91),
        width: SizeConfig.relativeWidth(97.10),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius:BorderRadius.circular(8)
        ),
        child:  Column(
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
                 onPressed: () {model.redirectToPage(SelectCarViewRoute);},
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


  Widget _pastride(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.65)),
      child: Container(
        padding: EdgeInsets.only(top: SizeConfig.relativeHeight(2)),
        height: SizeConfig.relativeHeight(20.91),
        width: SizeConfig.relativeWidth(97.10),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius:BorderRadius.circular(8)
        ),
        child:  Column(
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




//  Widget _currentride(DashboardViewModel model){
//    return Container(
//           padding: EdgeInsets.only(left:SizeConfig.relativeWidth(3.5),
//          top: SizeConfig.relativeHeight(2.2)),
////      height: SizeConfig.relativeHeight(5.91),
////      width: SizeConfig.relativeWidth(35.10),
//      decoration: BoxDecoration(
//        color:Colors.blueGrey,
//        borderRadius: BorderRadius.circular(10)
//      ),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Row(
//            children: [
//              Text("INR 10000"),
//              SizeConfig.horizontalSpacer(35.0),
//              InkWell(
//                onTap: (){},
//                child: Container(
//                  height: SizeConfig.relativeHeight(3.81),
//                  width: SizeConfig.relativeWidth(24.38),
//                  decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(5.0),
//                    color: AppColors.blueColor
//                  ),
//                  child: Align(
//                    alignment: Alignment.center,
//                      child: Text("Start Ride",style: TextStyle(fontSize: SizeConfig.setSp(16),
//                          color: AppColors.whiteColor,
//                          fontFamily: AppTheme.interBold),)),
//                ),
//              ),
//            ],
//          ),
//          SizeConfig.verticalSpacer(6.2),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Text("From"),
//              Text("To                                 "),
//            ],
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Text("2:30 PM"),
//              Text("11:30 PM                      "),
//            ],
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Text("Malleswaram ,Bangalore"),
//              Text("RR Nagar ,Bangalore   "),
//            ],
//          ),
//        ],
//      ),
//
//    );
//  }
//
//
//  Widget _appDrawer(DashboardViewModel model) {
//    return SingleChildScrollView(
//      child: Container(
//        width: double.infinity,
//        padding: EdgeInsets.only(
//          top: SizeConfig.relativeHeight(0.64),
//          bottom: SizeConfig.relativeHeight(7),
//        ),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            ListTile(
//              contentPadding: EdgeInsets.only(
//                right: SizeConfig.relativeWidth(3.64),
//              ),
//              dense: true,
//              leading: IconButton(
//                icon: Icon(
//                  MdiIcons.menu,
//                  color: AppColors.black,
//                  size: SizeConfig.relativeSize(15),
//                ),
//                onPressed: () => Navigator.pop(context),
//              ),
//              trailing: Wrap(
//                children: [
//                  Text(
//                    "MixAlpha",
//                    style: TextStyle(
//                      fontFamily: AppTheme.interBold,
//                      color: AppColors.black,
//                      fontSize: SizeConfig.setSp(16.0),
//                      fontStyle: FontStyle.normal,
//                    ),
//                  ),
//                  SizeConfig.horizontalSpacer(2.42),
//                  ClipRRect(
//                    borderRadius: BorderRadius.circular(5.0),
//                    child: Container(
//                      width: SizeConfig.relativeWidth(6.74),
//                      height: SizeConfig.relativeWidth(6.74),
//                      child: CachedNetworkImage(
//                        imageUrl: ImageNetwork.desertImage,
//                        fit: BoxFit.fill,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            SizeConfig.verticalSpacer(0.6),
//            InkWell(
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(AddCashViewRoute);
//              },
//              child: ListTile(
////        contentPadding: EdgeInsets.zero,
//                dense: true,
//                leading: Wrap(
//                  children: [
//                    SvgPicture.asset(
//                      ImagesPaths.iconRupee,
//                      width: SizeConfig.relativeWidth(3),
//                      height: SizeConfig.relativeHeight(3.4),
//                    ),
//                    SizeConfig.horizontalSpacer(7.5),
//                    Text(
//                      "₹51",
//                      style: TextStyle(
//                        fontFamily: AppTheme.interBold,
//                        color: AppColors.black,
//                        fontSize: SizeConfig.setSp(16.0),
//                      ),
//                    ),
//                  ],
//                ),
//                trailing: Container(
//                  width: SizeConfig.relativeWidth(21.93),
//                  height: SizeConfig.relativeHeight(5),
//                  child: CustomBorderButton(
//                    //  borderRadius: 5.0,
//                    title: 'Add Cash',
//                    onPress: () {
//                      Navigator.pop(context);
//                      // model.redirectToPage(AddCashViewRoute);
//                    },
//                  ),
//                ),
//              ),
//            ),
////            _getDrawerListTileImages(
////              imageName: ImagesPaths.iconRupee,
////              title: "₹51",
////              showTrailingIcon: true,
////              onTap: () {
////                model.redirectToPage(AddCashViewRoute);
////              },
////            ),
//            _getDrawerListTileImages(
//              imageName: ImagesPaths.iconLightCoin,
//              title: "21",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                //  model.redirectToPage(AnalyticsViewRoute);
//              },
//            ),
//            Divider(
//              // color: AppColors.lightGrey,
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.walletOutline,
//              title: "Pay",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(PayViewRoute);
//              },
//            ),
//            Divider(
//              // color: AppColors.lightGrey,
//            ),
//            _getDrawerListTileImages(
//              // imageName: ImagesPaths.iconMyTournaments,
//              title: "My Tournaments",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(GameViewRoute);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.accountCircleOutline,
//              title: "My Account",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(ProfileAccountViewRoute);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.arch,
//              title: "Levels",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                //  model.redirectToPage(LevelsViewRoute);
//              },
//            ),
//            Divider(
//              //color: AppColors.lightGrey,
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.commentAlertOutline,
//              title: "Feedback",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                //   model.redirectToPage(FeedbackViewRoute);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.help,
//              title: "Helpdesk",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(HelpDeskViewRoute);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.shareVariant,
//              title: "Share & Invite",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                //model.redirectToPage(ReferralViewRoute);
//              },
//            ),
//            Divider(
//              //  color: AppColors.lightGrey,
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.shieldAccountOutline,
//              title: "Privacy Policy",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.security,
//              title: "Terms & Conditions",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.accountSupervisor,
//              title: "Community Guidelines",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.informationOutline,
//              title: "About Us",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(GameTournamentDescViewRoute);
//              },
//            ),
//            _getDrawerListTile(
//              iconName: MdiIcons.power,
//              title: "Log Out",
//              showTrailingIcon: false,
//              onTap: () {
//                Navigator.pop(context);
//                // model.redirectToPage(RewardsViewRoute);
//              },
//            ),
//            Padding(
//              padding: EdgeInsets.all(
//                SizeConfig.relativeWidth(3.64),
//              ),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: [
//                  Text(
//                    "V 1.1",
//                    style: TextStyle(
//                      fontFamily: AppTheme.interBold,
//                      color: AppColors.black,
//                      fontSize: SizeConfig.setSp(16.0),
//                    ),
//                  ),
//                  SizeConfig.horizontalSpacer(2.7),
//                  Image(
//                    // image: AssetImage(ImagesPaths.iconGOGAME),
//                    width: SizeConfig.relativeWidth(6.99),
//                    height: SizeConfig.relativeHeight(3.40),
//                  ),
//                ],
//              ),
//            ),
//            SizeConfig.verticalSpacer(2.06),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _getDrawerListTile({IconData iconName, String title, bool showTrailingIcon, Function onTap}) {
//    return Material(
//      child: InkWell(
//        onTap: onTap,
//        child: ListTile(
////        contentPadding: EdgeInsets.zero,
//          dense: true,
//          leading: Wrap(
//            children: [
//              Icon(
//                iconName,
//                color: AppColors.black,
//              ),
//              SizeConfig.horizontalSpacer(7),
//              Text(
//                title,
//                style: TextStyle(
//                  fontFamily: AppTheme.interBold,
//                  color: AppColors.black,
//                  fontSize: SizeConfig.setSp(16.0),
//                ),
//              ),
//            ],
//          ),
//          trailing: showTrailingIcon
//              ? Container(
//            width: SizeConfig.relativeWidth(21.93),
//            height: SizeConfig.relativeHeight(5),
//            child: CustomBorderButton(
//              // borderRadius: 5.0,
//              title: 'Add Cash',
//              onPress: () {},
//            ),
//          )
//              : null,
//        ),
//      ),
//    );
//  }
//
//  Widget _getDrawerListTileImages({String imageName, String title, bool showTrailingIcon, Function onTap}) {
//    return InkWell(
//      onTap: onTap,
//      child: ListTile(
////        contentPadding: EdgeInsets.zero,
//        dense: true,
//        leading: Wrap(
//          children: [
//            SvgPicture.asset(
//              imageName,
//              width: SizeConfig.relativeWidth(4),
//              height: SizeConfig.relativeHeight(4),
//            ),
//            SizeConfig.horizontalSpacer(8.0),
//            Text(
//              title,
//              style: TextStyle(
//                fontFamily: AppTheme.interBold,
//                color: AppColors.black,
//                fontSize: SizeConfig.setSp(16.0),
//              ),
//            ),
//          ],
//        ),
//        trailing: showTrailingIcon
//            ? Container(
//          width: SizeConfig.relativeWidth(21.93),
//          height: SizeConfig.relativeHeight(5),
//          child: CustomBorderButton(
//            //    borderRadius: 5.0,
//            title: 'Add Cash',
//            onPress: () {},
//          ),
//        )
//            : null,
//      ),
//    );
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



