import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_divider.dart';

class CustomItemTitleWidget extends StatelessWidget {
  final String title;
  final double addTopMargin;
  final String iconPath;
  final Function onPress;

  CustomItemTitleWidget({this.title, this.iconPath, this.onPress,this.addTopMargin=0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.relativeHeight(3.38+addTopMargin),
//            top: SizeConfig.relativeHeight(5.22),

            bottom: SizeConfig.relativeHeight(2.09),
          ),
          child: Row(
            children: <Widget>[
              iconPath == null ? Container() : SvgPicture.asset(iconPath),
              Container(
                width: iconPath == null ? 0 : 8.2,
              ),
              Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: AppTheme.ffRegular,
                          color: AppTheme.text8Color,
                          fontSize: SizeConfig.setSp(16),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0))),
            ],
          ),
        ),
        AppDivider(height: 2,),
        SizeConfig.verticalSpacer(1.29),
      ],
    );
  }
}
