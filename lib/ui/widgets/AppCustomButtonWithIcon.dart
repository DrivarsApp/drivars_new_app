import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCustomButtonWithIcon extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isDisabled;
  final List<Color> gradientColors;
  final double height;
  final double width;
  final IconData iconImage;

  AppCustomButtonWithIcon(this.title, this.height, this.width,
      {this.gradientColors = AppColors.purpleGradientColors,
      this.onPress,
      this.isDisabled = false,
      this.iconImage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        padding: EdgeInsets.all(
          SizeConfig.relativeWidth(2.43),
        ),
//        height: height,
        width: width,
        decoration: new BoxDecoration(
          gradient:
              LinearGradient(colors: gradientColors, tileMode: TileMode.clamp),
          borderRadius:
              BorderRadius.circular(SizeConfig.relativeHeight(8.37) / 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconImage,
              color: AppColors.whiteColor,
//              width: SizeConfig.relativeWidth(3.12),
//              height: SizeConfig.relativeHeight(1.87),
            ),
            SizeConfig.horizontalSpacer(1),
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppTheme.interMedium,
                  fontStyle: FontStyle.normal,
                  fontSize: SizeConfig.setSp(17),
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
