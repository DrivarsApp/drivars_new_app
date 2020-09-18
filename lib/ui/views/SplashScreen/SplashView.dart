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
import 'package:gogame/ui/views/SplashScreen/SplashViewModel.dart';
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

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with BaseCommonWidget,TickerProviderStateMixin {
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
    return ViewModelProvider<SplashViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: SplashViewModel(context),
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

  Widget _getBody(SplashViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(SplashViewModel model) {
    return Scaffold(

//


      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: SizeConfig.relativeHeight(13)),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:Hexcolor('#205cbe'),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: SizeConfig.relativeWidth(30.74),
                height: SizeConfig.relativeWidth(30.74),
                child: Image.asset(ImagesPaths.icondrivars,fit: BoxFit.fill,),

              ),
            ),
                      SizeConfig.verticalSpacer(2),

                      InkWell(
                        child: Text("WE Drive Vehicle",style: TextStyle(fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(24),
                        color: AppColors.white)),
                        onTap: (){

                          },
                      ),

                      SizeConfig.verticalSpacer(10),
                      Container(
//                        height: SizeConfig.relativeWidth(80.43),
//                        width: SizeConfig.relativeWidth(41.37),
                        child: SvgPicture.asset(
                          ImagesPaths.iconsplash,
                         height: SizeConfig.relativeWidth(80.43),
                        width: SizeConfig.relativeWidth(41.37),
                        ),
                      ),

                    ],
                  )
                ) ],
            ),


          ],
        ),
      ),

    );

  }







}






