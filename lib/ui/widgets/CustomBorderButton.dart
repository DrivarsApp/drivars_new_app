import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class CustomBorderButton extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isDisabled;

  const CustomBorderButton({this.title, this.onPress, this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        height: SizeConfig.relativeHeight(8.39),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.greyShadow,
                offset: Offset(0, 0),
                blurRadius: 6,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontFamily: AppTheme.interBold,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.setSp(16),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
