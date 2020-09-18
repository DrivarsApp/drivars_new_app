import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundIconWidget extends StatelessWidget {
  final double circleSize;
  final double iconWidth;
  final double iconHeight;

  final double radius;
  final String icon;

  RoundIconWidget({this.circleSize,this.iconWidth,this.iconHeight,this.radius,this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: SizeConfig.relativeSize(circleSize),
      width: SizeConfig.relativeSize(circleSize),
      decoration: BoxDecoration(
          color: AppTheme.plGreyColor,
          border: Border.all(
              width: 1,
              color: AppTheme.plGreyColor,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.relativeSize(radius)))),
      child: Center(
        child: Container(
          height: SizeConfig.relativeHeight(iconWidth/2.5),
          width: SizeConfig.relativeHeight(iconHeight/2.5),
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
