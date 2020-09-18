import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_divider.dart';

class StatusFieldWidget extends StatelessWidget {
  final String title;
  final String value;

  StatusFieldWidget({this.title, this.value});

  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizeConfig.verticalSpacer(2.09),

        Text(
          title,
          style: TextStyle(
            fontFamily: AppTheme.ffRegular,
            color: AppTheme.text7Color,
            fontSize: SizeConfig.setSp(14),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
          ),
        ),

        SizeConfig.verticalSpacer(0.61),


        Row(
          children: <Widget>[
            Expanded(
              child: Opacity(
                opacity: 0.5,
                child: Text(
                  value,
                  style: TextStyle(
                    fontFamily: AppTheme.ffRegular,
                    color: AppTheme.text7Color,
                    fontSize: SizeConfig.setSp(14),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.13,
                  ),
                ),
              ),
            ),
            SvgPicture.asset(AppTheme.iconRightAngle),

          ],),
        SizeConfig.verticalSpacer(1.23),
        AppDivider(height: 2,)

      ],

    );
  }
}
