import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_divider.dart';

class SupportItemWidget extends StatelessWidget {
  final String title;
  final Function onPress;

  SupportItemWidget({this.title,  this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPress(),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.relativeHeight(2.83),
              bottom: SizeConfig.relativeHeight(2.70),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(title,
                        style: TextStyle(
                            fontFamily: AppTheme.ffRegular,
                            color: AppTheme.text1Color,
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
      ),
    );
  }
}
