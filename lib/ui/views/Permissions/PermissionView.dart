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
import 'package:intl/intl.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;

class PermissionView extends StatefulWidget {
  @override
  _PermissionViewState createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView>
    with BaseCommonWidget, TickerProviderStateMixin {
  TextEditingController usernameController = new TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(3.64),
          ),
          child: Column(
            children: [
              Container(
                width: SizeConfig.relativeWidth(101.1),
                height: SizeConfig.relativeHeight(55.02),
                child: SvgPicture.asset(
                  ImagesPaths.iconPaperMap,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Allow Permissions ",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppTheme.interRegular,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(24.0),
                ),
              ),
              SizeConfig.verticalSpacer(4),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.phone,
                    size: SizeConfig.relativeWidth(10.6),
                  ),
                  //SizeConfig.horizontalSpacer(11),
                  Text(
                    "Phone Number for account security  and new updates ",
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppTheme.interRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(14.0),
                    ),
                  ),
                ],
              ),
              SizeConfig.verticalSpacer(1.60),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.location_on,
                    size: SizeConfig.relativeWidth(14.6),
                  ),
                  //SizeConfig.horizontalSpacer(11),
                  Text(
                    "Current location to get pickup location",
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppTheme.interRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(14.0),
                    ),
                  ),
                ],
              ),
              SizeConfig.verticalSpacer(3),
              Container(
                height: SizeConfig.relativeHeight(7.0),
                width: SizeConfig.relativeWidth(55),
                padding: EdgeInsets.only(
                  left: SizeConfig.relativeWidth(7.52),
                  right: SizeConfig.relativeWidth(7.52),
                ),
                child: CustomBorderButton(
                  title: 'Allow',
                  onPress: () {
                    model.redirectToPage(DashboardViewRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
