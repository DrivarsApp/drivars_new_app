import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomItemContainer extends StatelessWidget {
  final String iconPath;
  final double iconContainerSize = SizeConfig.relativeHeight(6.6);

  final Color iconColor;
  final Color backgroundColor;
  final Function onTap;

  final String text;
  final double textSize = SizeConfig.setSp(12);

  CustomItemContainer(
      {Key key,
      this.iconPath,
      this.iconColor,
      this.backgroundColor = Colors.white,
      this.text,
      this.onTap})
      : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          children: <Widget>[
            Align(
              child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(iconContainerSize / 6),
                    child: SvgPicture.asset(
                      iconPath,
                      color: iconColor,
                    ),
                  ),
                  width: iconContainerSize,
                  height: iconContainerSize,
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd5d5d5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: backgroundColor,
                  )),
            ),
            SizeConfig.verticalSpacer(1),
            Text(
              text,
              style: TextStyle(
                color: Color(0xff24253d),
                fontSize: SizeConfig.setSp(12),
                fontFamily: AppTheme.ffRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
