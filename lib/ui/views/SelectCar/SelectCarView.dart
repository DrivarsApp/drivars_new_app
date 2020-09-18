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
import 'package:gogame/ui/views/SelectCar/SelectCarViewModel.dart';
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

class SelectCarView extends StatefulWidget {
  @override
  _SelectCarViewState createState() => _SelectCarViewState();
}

class _SelectCarViewState extends State< SelectCarView> with BaseCommonWidget,TickerProviderStateMixin {


  @override
  void initState() {
    setState(() {});
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SelectCarViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel:  SelectCarViewModel(context),
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

  Widget _getBody( SelectCarViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer( SelectCarViewModel model) {
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
//              Container(
//                height: SizeConfig.relativeHeight(19.91),
//                width: SizeConfig.relativeWidth(87.10),
//                decoration: BoxDecoration(
//                    color: Colors.blueGrey,
//                    borderRadius:BorderRadius.circular(8)
//                ),
//                child: Column(
//                  children: [
//                    SizeConfig.verticalSpacer(3),
//                    Row(
//                      children: [
//                        SizeConfig.horizontalSpacer(7),
//                        Icon(Icons.location_on),
//                        SizeConfig.horizontalSpacer(7),
//                        Container(
//                            height: SizeConfig.relativeHeight(6),
//                            width: SizeConfig.relativeWidth(60),
//                            child: TextField(
//                              decoration: InputDecoration(
//                                border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                    color: Colors.blue,
//                                  ),
//                                  borderRadius: BorderRadius.circular(10.0),
//                                ),
//                                hintText: "Pickup Location",
//                              ),
//                            )
//                        )
//                      ],
//                    ),
//                    SizeConfig.verticalSpacer(2),
//                    Row(
//                      children: [
//                        SizeConfig.horizontalSpacer(7),
//                        Icon(Icons.location_on),
//                        SizeConfig.horizontalSpacer(7),
//                        Container(
//                          height: SizeConfig.relativeHeight(6),
//                          width: SizeConfig.relativeWidth(60),
//                          child: TextField(
//                            decoration: InputDecoration(
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
//                  ],
//                ),
//              ),
            ),
            SizeConfig.verticalSpacer(1.5),
            Container(
              height: SizeConfig.relativeHeight(80),
              width: SizeConfig.relativeWidth(87.10),
              decoration: BoxDecoration(
                  color:Hexcolor('#3E4E87'),
                  borderRadius:BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  SizeConfig.verticalSpacer(.5),
                  _staggeredGrid(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizeConfig.horizontalSpacer(22.9),
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
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                    //  SizeConfig.horizontalSpacer(3.5),
//                      Container(
//                        height: SizeConfig.relativeHeight(7.93),
//                        width: SizeConfig.relativeWidth(26.21),
//                        decoration: BoxDecoration(
//                          color: Colors.white,
//                          borderRadius: BorderRadius.circular(7)
//                        ),
//                        child: Column(
//                          children: [
//                            Icon(Icons.directions_car),
//                            Text("Sedan")
//                          ],
//                        ),
//                      ),
//                     // SizeConfig.horizontalSpacer(3.5),
//                      Container(
//                        height: SizeConfig.relativeHeight(7.93),
//                        width: SizeConfig.relativeWidth(26.21),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(7)
//                        ),
//                        child: Column(
//                          children: [
//                            Icon(Icons.directions_car),
//                            Text("Sedan")
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Container(
//                        height: SizeConfig.relativeHeight(7.93),
//                        width: SizeConfig.relativeWidth(26.21),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(7)
//                        ),
//                        child: Column(
//                          children: [
//                            Icon(Icons.directions_car),
//                            Text("Sedan")
//                          ],
//                        ),
//                      ),
//                      Container(
//                        height: SizeConfig.relativeHeight(7.93),
//                        width: SizeConfig.relativeWidth(26.21),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(7)
//                        ),
//                        child: Column(
//                          children: [
//                            Icon(Icons.directions_car),
//                            Text("Sedan")
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Container(
//                        height: SizeConfig.relativeHeight(7.93),
//                        width: SizeConfig.relativeWidth(26.21),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(7)
//                        ),
//                        child: Column(
//                          children: [
//                            Icon(Icons.directions_car),
//                            Text("Sedan")
//                          ],
//                        ),
//                      ),
//                      Container(
//                        height: SizeConfig.relativeHeight(7.93),
//                        width: SizeConfig.relativeWidth(26.21),
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.circular(7)
//                        ),
//                        child: Column(
//                          children: [
//                            Icon(Icons.directions_car),
//                            Text("Sedan")
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
                  


                ],
              ),
            )


      ] )));

  }






  Widget _staggeredGrid() {
    return StaggeredGridView.countBuilder(
      itemCount: 6,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: SizeConfig.relativeWidth(0.4),
      //mainAxisSpacing: SizeConfig.relativeHeight(1.00),
      itemBuilder: (BuildContext context, int innerIndex) {
        return InkWell(
          onTap: () {},
          child: Container(
           // height: SizeConfig.relativeWidth(46.93),
            //width: SizeConfig.relativeHeight(26.93),
//            padding: EdgeInsets.only(
//              left: SizeConfig.relativeWidth(3.64),
//              right: SizeConfig.relativeWidth(3.64),
//            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:  MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: SizeConfig.relativeWidth(25.93),
                    width: SizeConfig.relativeWidth(35.93),
                    padding: EdgeInsets.only(
                      top: SizeConfig.relativeHeight(1.49),left: SizeConfig.relativeWidth(1.79),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.greyShadow,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyShadow,
                          offset: Offset(0, 0),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(MdiIcons.car,size: SizeConfig.relativeSize(30),),
                        Text(
                          "SEDAN",
                          style: TextStyle(
                            fontFamily: AppTheme.interBold,
                            color: AppColors.black,
                            fontSize: SizeConfig.setSp(16.0),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
//

                  ]),
        ) ],
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.extent(1, 160);
      },
    );
  }
}

Widget _getDrawerListTileImages(
    {String imageName, String title, bool showTrailingIcon, Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
//        contentPadding: EdgeInsets.zero,
      dense: true,
      leading: Wrap(
        children: [
          SvgPicture.asset(
            imageName,
            width: SizeConfig.relativeWidth(4),
            height: SizeConfig.relativeHeight(4),
          ),
          SizeConfig.horizontalSpacer(8.0),
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTheme.interBold,
              color: AppColors.black,
              fontSize: SizeConfig.setSp(16.0),
            ),
          ),
        ],
      ),
      trailing: showTrailingIcon
          ? Container(
        width: SizeConfig.relativeWidth(21.93),
        height: SizeConfig.relativeHeight(5),
        child: CustomBorderButton(
        //  borderRadius: 5.0,
          title: 'Add Cash',
          onPress: () {},
        ),
      )
          : null,
    ),
  );
}






