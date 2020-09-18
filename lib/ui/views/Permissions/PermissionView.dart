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
import 'package:gogame/ui/views/Permissions/PermissionViewModel.dart';
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

class PermissionView extends StatefulWidget {
  @override
  _PermissionViewState createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> with BaseCommonWidget,TickerProviderStateMixin {
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
    return ViewModelProvider<PermissionViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: PermissionViewModel(context),
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

  Widget _getBody(PermissionViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(PermissionViewModel model) {
    return Scaffold(

//      appBar: AppBar(
//        backgroundColor: Hexcolor('#205cbe'),
//        leading: Icon(Icons.menu,color:AppColors.white,),
//        title: Text("Hii",style: TextStyle(color: AppColors.white),),
//      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
           // SizeConfig.verticalSpacer(2.15),
            Container(
              padding: EdgeInsets.only(top: SizeConfig.relativeHeight(3)),
              height: SizeConfig.relativeHeight(45.91),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Hexcolor('#205cbe'),
                borderRadius:BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),


            ),
            SizeConfig.verticalSpacer(4),
            Text(
                "Allow Permissions ",
                style:  TextStyle(
                    color:   Color(0xff000000),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    fontStyle:  FontStyle.normal,
                    fontSize: 24.0
                )
            ),
            SizeConfig.verticalSpacer(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone,size: SizeConfig.relativeSize(18),),
                SizeConfig.horizontalSpacer(11),
                Text(
                    "Phone Number for account security  and new updates ",
                    style: const TextStyle(
                        color:  const Color(0xff000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    )
                )
              ],
            ),
            SizeConfig.verticalSpacer(1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on,size: SizeConfig.relativeSize(18),),
                SizeConfig.horizontalSpacer(12),
                Text(
                    "Current location to get pickup location",
                    style: const TextStyle(
                        color:  Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0
                    )
                )

              ],
            ),
            SizeConfig.verticalSpacer(3),
            Container(
              height: SizeConfig.relativeHeight(7.0),
              width:SizeConfig.relativeWidth(55),
              padding: EdgeInsets.only(
                left: SizeConfig.relativeWidth(7.52),
                right: SizeConfig.relativeWidth(7.52),
              ),
              child: CustomButton(
                title: 'Allow',
                onPress: () {
                  Navigator.pop(context);
                  model.redirectToPage(DashboardViewRoute);
//
                  //_showModalSheet(context, model);
                },
              ),
            ),


          ],
        ),
      ),

    );

  }

}





