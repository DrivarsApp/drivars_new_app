import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isDisabled;
  final double borderRadius;
  final String color;

 final double Height;  final double Width;

  const CustomButton({
    this.title,
    this.onPress,
    this.isDisabled,
    this.borderRadius = 10.0,
    this.color, this.Height, this.Width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyShadow,
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
          color: AppColors.yellow,
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
