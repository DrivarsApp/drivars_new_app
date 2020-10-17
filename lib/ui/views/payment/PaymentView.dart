import 'package:flutter/material.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/constants/route_names.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/views/payment/PaymentViewModel.dart';
import 'package:gogame/ui/widgets/appDrawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentView extends StatefulWidget {
  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with BaseCommonWidget {
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
    return ViewModelProvider<PaymentViewModel>.withConsumer(
      onModelReady: (model) {},
      viewModel: PaymentViewModel(context),
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

  Widget _getBody(PaymentViewModel model) {
    return Stack(
      children: <Widget>[
        //Actual widget data
        _getBaseContainer(model),
        //Progress loader
        getProgressBar(model.state),
      ],
    );
  }

  Widget _getBaseContainer(PaymentViewModel model) {
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
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.relativeWidth(2.42),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeConfig.verticalSpacer(2),
              Container(
                width: double.infinity,
                height: SizeConfig.relativeHeight(13.39),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: AppColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      ImagesPaths.iconMoney,
                      width: SizeConfig.relativeWidth(30),
                      height: SizeConfig.relativeHeight(10.0),
                    ),
                    Text(
                      "Credits ",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(24.0),
                      ),
                    ),
                    Text(
                      "100",
                      style: TextStyle(
                        color: AppColors.blackLight,
                        fontFamily: AppTheme.interRegular,
                        fontStyle: FontStyle.normal,
                        fontSize: SizeConfig.setSp(24.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizeConfig.verticalSpacer(2),
              InkWell(
                onTap: () {
                  model.redirectToPage(OrderViewRoute);
                },
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.relativeHeight(7.88),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        ImagesPaths.iconWallet,
                        width: SizeConfig.relativeWidth(30),
                        height: SizeConfig.relativeHeight(6.0),
                      ),
                      Text(
                        "Transaction History",
                        style: TextStyle(
                          color: AppColors.blackLight,
                          fontFamily: AppTheme.interRegular,
                          fontStyle: FontStyle.normal,
                          fontSize: SizeConfig.setSp(16.0),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                        size: SizeConfig.relativeWidth(5.3),
                      ),
                    ],
                  ),
                ),
              ),
              SizeConfig.verticalSpacer(2),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                ),
                child: _paymentList(),
              ),
              SizeConfig.verticalSpacer(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentList() {
    return Container(
      child: Column(
        children: <Widget>[
          ListView.separated(
            //scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.white,
                ),
                width: double.infinity,
                height: SizeConfig.relativeHeight(6.9),
                child: ListTile(
                  dense: true,
                  //contentPadding: EdgeInsets.zero,
                  leading: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.relativeWidth(45),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyShadow,
                          offset: Offset(0, 0),
                          blurRadius: 6,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: Image.asset(
                        ImagesPaths.iconTrophy,
                        width: SizeConfig.relativeWidth(22.08),
                        height: SizeConfig.relativeHeight(3.33),
                      ),
                    ),
                  ),
                  title: Text(
                    'Paytm',
                    style: TextStyle(
                      color: AppColors.blackLight,
                      fontFamily: AppTheme.interRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(16.0),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.greyDarkColor,
                height: SizeConfig.relativeHeight(3),
              );
            },
          ),
          SizeConfig.verticalSpacer(1),
        ],
      ),
    );
  }
}
