import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:intl/intl.dart';

class DashboardGradientContainer extends StatelessWidget {
  DashboardGradientContainer(
    this.title,
    this.subtitle,
    this.onTap,
    this.imageName,
    this.gradientColors, [
    this.titleColor = Colors.black,
    this.alignment = Alignment.topLeft,
  ]);

  final Function onTap;
  final Alignment alignment;
  final List gradientColors;
  final String title, imageName, subtitle;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(
              SizeConfig.relativeWidth(1.21),
            ),
//            height: SizeConfig.relativeHeight(6.57),
            width: SizeConfig.relativeWidth(28.98),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Center(
              child: Text(
                NumberFormat.compact().format(double.parse(title)),
                style: TextStyle(
                  fontFamily: AppTheme.interBold,
                  fontSize: SizeConfig.setSp(29),
                  color: titleColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.relativeHeight(-1.5),
            right: SizeConfig.relativeWidth(0),
            left: SizeConfig.relativeWidth(0),
            child: Align(
              alignment: FractionalOffset.topCenter,
              child: SvgPicture.asset(
                imageName,
                fit: BoxFit.fill,
                height: SizeConfig.relativeHeight(3.20),
                width: SizeConfig.relativeHeight(4.83),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
