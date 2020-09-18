import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final Function onTap;
  final String title;

  const CustomGradientButton({this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.gradientPink, AppColors.gradientBlue],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppTheme.interMedium,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.setSp(17),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
