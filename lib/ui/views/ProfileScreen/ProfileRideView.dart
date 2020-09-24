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

import 'package:gogame/ui/views/ProfileScreen/ProfileViewModel.dart';
import 'package:gogame/ui/views/bookride/BookRideView.dart';

import 'package:gogame/ui/views/dashboard/DashboardViewModel.dart';
import 'package:gogame/ui/widgets/AppTextField.dart';
import 'package:gogame/ui/widgets/CustomBorderButton.dart';
import 'package:gogame/ui/widgets/CustomButton.dart';
import 'package:gogame/ui/widgets/PickupdropContainer.dart';
import 'package:gogame/ui/widgets/PickupdropfilledContainer.dart';
import 'package:gogame/ui/widgets/TextFieldCustom.dart';

import 'package:gogame/viewmodels/base_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math' as math;

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with BaseCommonWidget, TickerProviderStateMixin {
  TextEditingController usernameController = new TextEditingController();

  TabController _tabController;

  final _usernameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final String _dateFormat = "dd/MM/yyyy";

  bool _isChecked = false;

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
    return ViewModelProvider<ProfileViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: ProfileViewModel(context),
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

  Widget _getBody(ProfileViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(ProfileViewModel model) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Hexcolor('#205cbe'),
          ),
          padding: EdgeInsets.only(
            left: SizeConfig.relativeWidth(4.85),
            right: SizeConfig.relativeWidth(3.64),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeConfig.verticalSpacer(8),
              Center(
                child: Container(
                  width: SizeConfig.relativeWidth(25.84),
                  height: SizeConfig.relativeWidth(25.84),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: ImageNetwork.placeholderImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),

              SizeConfig.verticalSpacer(3.10),
              Container(
                width: SizeConfig.relativeWidth(90.83),
                height: SizeConfig.relativeHeight(6.36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldCustom(
                      textController: _usernameController,
                      showSuffix: true,
                      HintText: 'First Name',
                      textInputType: TextInputType.text,
                    ),
                    TextFieldCustom(
                      readonly: true,
                      textController: _mobileController,
                      HintText: 'Last Name',
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(3.10),
              Container(
                width: SizeConfig.relativeWidth(90.83),
                height: SizeConfig.relativeHeight(6.36),
                child: TextFieldCustom(
                  textController: _bioController,
                  HintText: 'Email Address',
                  textInputType: TextInputType.text,
                ),
              ),
              SizeConfig.verticalSpacer(3.10),
              Container(
                width: SizeConfig.relativeWidth(90.83),
                height: SizeConfig.relativeHeight(6.36),
                child: TextFieldCustom(
                  textController: _bioController,
                  HintText: 'Contact Number',
                  textInputType: TextInputType.text,
                ),
              ),
              SizeConfig.verticalSpacer(3.10),

              Container(
                width: SizeConfig.relativeWidth(90.83),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldCustom(
                      textController: _usernameController,
                      showSuffix: true,
                      HintText: 'City',
                      textInputType: TextInputType.text,
                    ),
                    TextFieldCustom(
                      readonly: true,
                      textController: _mobileController,
                      HintText: 'Zip',
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(3.10),

              Container(
                width: SizeConfig.relativeWidth(90.83),
                height: SizeConfig.relativeHeight(6.36),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: TextFieldCustom(
                  textController: _bioController,
                  HintText: 'Address',
                  textInputType: TextInputType.text,
                ),
              ),
              // SizeConfig.verticalSpacer(1.29),
              CheckboxListTile(
                title: Text(
                  'Save Address as your Pick up location',
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppTheme.interBold,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(14)),
                ),
                activeColor: Colors.white,
                checkColor: Colors.black,
                value: _isChecked,
                onChanged: (bool value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizeConfig.verticalSpacer(.59),
              Container(
                height: SizeConfig.relativeHeight(5.86),
                child: Row(
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
                        //    model.redirectToPage(ThankPopupViewRoute);
                        //  _showModalSheetTournament();
                      },
                    ),
                  ],
                ),
              ),

              SizeConfig.verticalSpacer(4),
              // PlayContainer(),
              SizeConfig.verticalSpacer(3),
            ],
          ),
        ),
      ),
    );
  }
}
