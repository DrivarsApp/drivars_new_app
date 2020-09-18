import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class CustomContainer extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  final String titleText;
  final String subtitleText;

  const CustomContainer(
      {Key key,
      this.containerHeight,
      this.containerWidth,
      this.titleText,
      this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(2.68),
        top: SizeConfig.relativeWidth(1.91),
      ),
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: AppColors.purpleGradientColors,
            begin: Alignment.topRight,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(
          SizeConfig.relativeWidth(4.87),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            titleText,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppTheme.interRegular,
              fontSize: SizeConfig.setSp(20),
            ),
          ),
          Text(
            subtitleText,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppTheme.interBold,
              fontSize: SizeConfig.setSp(26),
            ),
          ),
        ],
      ),
    );
  }
}
