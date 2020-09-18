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
import 'package:gogame/ui/views/dashboard/DashboardViewModel.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomBorderButton.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:gogame/ui/widgets/PickupdropContainer.dart';

import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with BaseCommonWidget,TickerProviderStateMixin {
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

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu,color:AppColors.white,),
        title: Text("Hii",style: TextStyle(color: AppColors.white),),
      ),
//      appBar: AppBar(
//        elevation: 0,
//        centerTitle: true,
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//        title:Text("Hello"),
//
//        actions: <Widget>[
//          Container(
//            padding: EdgeInsets.only(
//              top: SizeConfig.relativeHeight(2),
//              bottom: SizeConfig.relativeHeight(2),
//              right: SizeConfig.relativeWidth(3.64),
//            ),
//            child: ClipRRect(
//              borderRadius: BorderRadius.circular(5.0),
//              child: Container(
//                width: SizeConfig.relativeWidth(7.74),
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

      body: SingleChildScrollView(
        child: Container(
          height:  MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Hexcolor('#205cbe'),
          ),
          child: Column(
            children: [
              SizeConfig.verticalSpacer(2.15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.65)),
                child: Container(
                  padding: EdgeInsets.only(top: SizeConfig.relativeHeight(2)),
                  height: SizeConfig.relativeHeight(15.81),
                  width: SizeConfig.relativeWidth(97.10),
                  decoration: BoxDecoration(
                    color: Colors.white,
//                      color: Hexcolor('#205cbe'),
                    borderRadius:BorderRadius.circular(8)
                  ),
                  child:  Column( mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.relativeWidth(5.95)),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              "Select ride type ",
                              style:  TextStyle(
                                  color:  AppColors.lighttext,
                                  fontFamily: AppTheme.interBold,
                                  fontStyle:  FontStyle.normal,
                                  fontSize: SizeConfig.setSp(16)
                              )
                          ),
                        ),

                      ),SizeConfig.verticalSpacer(1.8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(6.14)),
                       child:  Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           ButtonCustom(
                            // imageName: ImagesPaths.iconPANCard,
                             title: 'One way Drop',
                             showIndicator: model.cashSelected,
                             onTap: () {
                               model.menuSelected(true);
                             },
                           ),
                           ButtonCustom(
                            // imageName: ImagesPaths.iconAadharCard,
                             title: 'Round Trip Return',
                             showIndicator: !model.cashSelected,
                             onTap: () {
                               model.menuSelected(false);
                             },
                           ),
                         ],
                       ),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//
////                      Container(
////                        height: SizeConfig.relativeHeight(3.67),
////                        width: SizeConfig.relativeWidth(31.55),
////                        decoration:BoxDecoration(
////                          color: Hexcolor("#ffc100"),
////                          borderRadius: BorderRadius.circular(10)
////                        ),
////                        child: Align(
////                            alignment:Alignment.center,
////                            child: Text("One Way Ride")),
////                      ),
////                      Container(
////                        height: SizeConfig.relativeHeight(3.67),
////                        width: SizeConfig.relativeWidth(31.55),
////                        decoration:BoxDecoration(
////                            color: Hexcolor("#ffc100"),
////                            borderRadius: BorderRadius.circular(10)
////                        ),
////                        child: Align(
////                            alignment:Alignment.center,
////                            child: Text("Round Trip")),
////                      )
//                    ],
//                  ),
                ),



//                    Row(
//
//                      children: <Widget>[
//                        SizeConfig.horizontalSpacer(7),
//                        KYCTabCard(
//                          //imageName: ImagesPaths.iconPANCard,
//                          title: 'One Way',
//                          showIndicator: model.cashSelected,
//                          onTap: () {
//                            model.menuSelected(true);
//                          },
//                        ),
//                        SizeConfig.horizontalSpacer(17),
//                        KYCTabCard(
//                          //imageName: ImagesPaths.iconAadharCard,
//                          title: 'Round Trip',
//                          showIndicator: !model.cashSelected,
//                          onTap: () {
//                            model.menuSelected(false);
//                          },
//                        ),
//                        SizeConfig.horizontalSpacer(2)
//
//                      ],
//                    ),
                    //SizeConfig.verticalSpacer(2),

//                     SizeConfig.verticalSpacer(5.4),
//
//                    Container(
//                      height: SizeConfig.relativeHeight(12.81),
//                      width: SizeConfig.relativeWidth(97.10),
//                      decoration: BoxDecoration(
//                        color: Colors.white
//                      ),
//
//                      child: Row(
//                        children: [
//                          SizeConfig.horizontalSpacer(7),
//                          Image(
//                            image: AssetImage(ImagesPaths.icongoal),
//                            width: SizeConfig.relativeWidth(6.99),
//                            height: SizeConfig.relativeHeight(8.40),
//                          ),
//
//                          SizeConfig.horizontalSpacer(7),
//                          Container(
//                            height: SizeConfig.relativeHeight(6),
//                            width: SizeConfig.relativeWidth(60),
//                              child: TextField(
//                                decoration: InputDecoration(
//                                  filled: true,
//                                  fillColor: Colors.grey[200],
//                                  border: OutlineInputBorder(
////                                  borderSide: BorderSide(
////                                    color: Hexcolor('#3E4E87'),
////                                  ),
//                                    borderRadius: BorderRadius.circular(10.0),
//                                  ),
//                                  hintText: "Pickup Location",
//                                ),
//                              )
//                          )
//                        ],
//                      ),
//                    ),
//                    SizeConfig.verticalSpacer(1),
//                    Row(
//                      children: [
//                        SizeConfig.horizontalSpacer(7),
//                        Image(
//                          image: AssetImage(ImagesPaths.iconplaceholder),
//                          width: SizeConfig.relativeWidth(6.99),
//                          height: SizeConfig.relativeHeight(8.40),
//                        ),
//
//                        SizeConfig.horizontalSpacer(7),
//                        Container(
//                          height: SizeConfig.relativeHeight(6),
//                          width: SizeConfig.relativeWidth(60),
//                          child: TextField(
//                            decoration: InputDecoration(
//                              filled: true,
//                              fillColor: Colors.grey[200],
//                              border: OutlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Colors.blue,
//                                ),
//                                borderRadius: BorderRadius.circular(10.0),
//                              ),
//                              hintText: "Drop Location",
//                            ),
//                          ),
//                        )
//                      ],
//                    ),


                    ],
                  ),

                ),
              ),
              SizeConfig.verticalSpacer(2),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.65)),
                child: Container(
                  height: SizeConfig.relativeHeight(21.81),
                  width: SizeConfig.relativeWidth(97.10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal:SizeConfig.relativeWidth(3.65) ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(MdiIcons.pin),
                            SizeConfig.horizontalSpacer(6.06),
                            Container(
                              height: SizeConfig.relativeHeight(6),
                              width: SizeConfig.relativeWidth(65.92),
                                child: TextField(
                                  decoration: InputDecoration(
//                        filled: true,
//                        fillColor: Colors.grey[200],
//                        border: OutlineInputBorder(
////                                  borderSide: BorderSide(
////                                    color: Hexcolor('#3E4E87'),
////                                  ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                                    hintText: "Please enter Pickup location",
                                  ),
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(MdiIcons.pin),
                            SizeConfig.horizontalSpacer(6.06),
                            Container(
                                height: SizeConfig.relativeHeight(6),
                                width: SizeConfig.relativeWidth(65.92),
                                child: TextField(
                                  decoration: InputDecoration(
//                        filled: true,
//                        fillColor: Colors.grey[200],
//                        border: OutlineInputBorder(
////                                  borderSide: BorderSide(
////                                    color: Hexcolor('#3E4E87'),
////                                  ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                                    hintText: "Please enter destination Location",
                                  ),
                                )
                            ),
                          ],
                        ),
                        SizeConfig.verticalSpacer(2),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(2.14)),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonCustom(
                                // imageName: ImagesPaths.iconPANCard,
                                title: 'In-City',
                                showIndicator: model.cashSelected,
                                onTap: () {
                                  model.menuSelected(true);
                                },
                              ),
                              SizeConfig.horizontalSpacer(5.28),
                              ButtonCustom(
                                // imageName: ImagesPaths.iconAadharCard,
                                title: 'OutStation',
                                showIndicator: !model.cashSelected,
                                onTap: () {
                                  model.menuSelected(false);
                                },
                              ),
                            ],
                          ),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//
////                      Container(
////                        height: SizeConfig.relativeHeight(3.67),
////                        width: SizeConfig.relativeWidth(31.55),
////                        decoration:BoxDecoration(
////                          color: Hexcolor("#ffc100"),
////                          borderRadius: BorderRadius.circular(10)
////                        ),
////                        child: Align(
////                            alignment:Alignment.center,
////                            child: Text("One Way Ride")),
////                      ),
////                      Container(
////                        height: SizeConfig.relativeHeight(3.67),
////                        width: SizeConfig.relativeWidth(31.55),
////                        decoration:BoxDecoration(
////                            color: Hexcolor("#ffc100"),
////                            borderRadius: BorderRadius.circular(10)
////                        ),
////                        child: Align(
////                            alignment:Alignment.center,
////                            child: Text("Round Trip")),
////                      )
//                    ],
//                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

          TabBar(
                controller: _tabController,
                labelColor: AppColors.white,
                labelStyle: TextStyle(
                  fontSize: SizeConfig.setSp(12),
                  fontFamily: AppTheme.interBold,
                ),
                indicatorColor: AppColors.white,
                indicatorPadding: EdgeInsets.zero,
                indicatorWeight: 2.0,
                indicatorSize:  TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Text(
                      'Current Ride',
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: SizeConfig.setSp(16),
                        fontFamily: AppTheme.interBold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Past Rides',
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: SizeConfig.setSp(16),
                        fontFamily: AppTheme.interBold,
                      ),
                    ),
                  ),
                ],
              ),
              SizeConfig.verticalSpacer(2.15),
              Container(
                height: SizeConfig.relativeHeight(26),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _noride(),
                    _noride(),

                   // _currentride(model),
                   // _pastride(),
                  ],

                ),
              ),
              SizeConfig.verticalSpacer(2),
                 Padding(
                   padding:EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(4)),
                   child: Container(
                     height: SizeConfig.relativeHeight(15.81),
                     width: SizeConfig.relativeWidth(97.10),
                     decoration: BoxDecoration(
                       color: Colors.white
                     ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: SizeConfig.relativeHeight(17.91),
                          width: SizeConfig.relativeWidth(43.10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: Hexcolor('#205cbe'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("INR 200.",textAlign:TextAlign.center,style: TextStyle(
                                  fontSize: SizeConfig.setSp(16),
                                  color: AppColors.white,
                                  fontFamily: AppTheme.interBold),
                              ),
                              SizeConfig.verticalSpacer(1.85),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("INR 200.",style: TextStyle(
                                      fontSize: SizeConfig.setSp(16),
                                      color: AppColors.white,
                                      fontFamily: AppTheme.interBold),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.account_balance_wallet,
                                      color: AppColors.black,
                                      size: SizeConfig.relativeSize(10.0),
                                    ),
                                    onPressed: (){},
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: SizeConfig.relativeHeight(17.91),
                          width: SizeConfig.relativeWidth(43.10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color:Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Drivers Package",textAlign:TextAlign.center,style: TextStyle(
                                  fontSize: SizeConfig.setSp(16),
                                  color: AppColors.white,
                                  fontFamily: AppTheme.interBold),
                              ),
                              SizeConfig.verticalSpacer(1.85),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.account_balance_wallet,
                                      color: AppColors.black,
                                      size: SizeConfig.relativeSize(10.0),
                                    ),
                                    onPressed: (){model.redirectToPage(SplashViewRoute);},
                                  )

//                              Icon(MdiIcons.walletOutline,size: SizeConfig.relativeSize(24),
//                                color: AppColors.white,),

                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                ),
                   ),
                 ),
            ],
          ),
        ),
      ),

    );

  }


  Widget _noride(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.relativeWidth(3.65),
          vertical: SizeConfig.relativeHeight(1)),
      child: Container(
        padding: EdgeInsets.only(top: SizeConfig.relativeHeight(4)),
        height: SizeConfig.relativeHeight(13.91),
        width: SizeConfig.relativeWidth(97.10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(8)
        ),
        child:  Column(
          children: [
           Icon(Icons.person,size: SizeConfig.relativeSize(25),),
            SizeConfig.verticalSpacer(3.0),
            Text(
                "Currently you have not hired driver ",
                style: TextStyle(
                    color:  Hexcolor('#555555'),
                    fontFamily: AppTheme.interBold,
                    fontStyle:  FontStyle.normal,
                    fontSize: SizeConfig.setSp(14)
                )
            )
          ],
        ),

      ),
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
            color: Colors.white,
            borderRadius:BorderRadius.circular(8)
        ),
        child:  Column(
          children: [
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("INR 1000",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(45),
             Container(
               height: SizeConfig.relativeHeight(5),
               width: SizeConfig.relativeWidth(20),
               child: RaisedButton(
                child: Text('Start'),
                color: Colors.grey,
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
                Text("From",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(40),
                Text("To",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),)
              ],
            ),
            Row(

              children: [
                SizeConfig.horizontalSpacer(4),
                Text("Malleswaram,Bangalore",style: TextStyle(
                    fontSize: SizeConfig.setSp(14),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(10),
                Text("RR Nagar, Bangalore",style: TextStyle(
                    fontSize: SizeConfig.setSp(14),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),)
              ],
            ),
            Row(

              children: [
                SizeConfig.horizontalSpacer(4),
                Text("2:30 PM",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(34),
                Text("9:30 PM",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),)
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
        height: SizeConfig.relativeHeight(13.91),
        width: SizeConfig.relativeWidth(97.10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(8)
        ),
        child:  Column(
          children: [
            Row(
              children: [
                SizeConfig.horizontalSpacer(4),
                Text("INR 1000",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(45),
                Text("Completed",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: Colors.grey,
                    fontFamily: AppTheme.interBold),),
              ],
            ),
            SizeConfig.verticalSpacer(5),
            Row(

              children: [
                SizeConfig.horizontalSpacer(4),
                Text("From",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,

                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(40),
                Text("To",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),)
              ],
            ),
            Row(

              children: [
                SizeConfig.horizontalSpacer(4),
                Text("Malleswaram,Bangalore",style: TextStyle(
                    fontSize: SizeConfig.setSp(14),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(10),
                Text("RR Nagar, Bangalore",style: TextStyle(
                    fontSize: SizeConfig.setSp(14),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),)
              ],
            ),
            Row(

              children: [
                SizeConfig.horizontalSpacer(4),
                Text("2:30 PM",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),),
                SizeConfig.horizontalSpacer(34),
                Text("9:30 PM",style: TextStyle(
                    fontSize: SizeConfig.setSp(16),
                    color: AppColors.white,
                    fontFamily: AppTheme.interBold),)
              ],
            )
          ],
        ),

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
        height: SizeConfig.relativeHeight(4.67),
        width: SizeConfig.relativeWidth(37.55),
        decoration: BoxDecoration(
          color: showIndicator ? Colors.yellow[700] : Colors.grey,
//          border: Border.all(
//            color: AppColors.blueColor,
//            width: 2,
//          ),
//          boxShadow: [
//            BoxShadow(
//              color: AppColors.white,
//              offset: Offset(0, 0),
//              blurRadius: 6,
//              spreadRadius: 0,
//            )
//          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(

                ),
                SizeConfig.horizontalSpacer(1.94),
                Text(
                  title,
                  style: TextStyle(
                    color: showIndicator ? AppColors.white : AppColors.white,
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



