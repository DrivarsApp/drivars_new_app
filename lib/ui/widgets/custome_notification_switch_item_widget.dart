import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_divider.dart';
import 'app_switch.dart';

class CustomNotificationSwitchItemWidget extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isEnabled;

  CustomNotificationSwitchItemWidget({this.title, this.onPress,this.isEnabled=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: SizeConfig.relativeHeight(1.95),
//            top: SizeConfig.relativeHeight(5.22),

            bottom: SizeConfig.relativeHeight(2.20),
          ),
          child: Row(
            children: <Widget>[

              Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontFamily: AppTheme.ffRegular,
                          color: AppTheme.text8Color,
                          fontSize: SizeConfig.setSp(16),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0))),
              AppSwitch(isEnabled:isEnabled,onChange: (isEnabled)=> onPress(isEnabled),),

            ],
          ),
        ),
        AppDivider(height: 2,),
        SizeConfig.verticalSpacer(1.29),
      ],
    );
  }
}
