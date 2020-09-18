import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

import 'app_switch.dart';

class CustomItemSwitchWidget extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final double fontSize;
  final Function(bool) onPress;
  final double latterSpacing;

  CustomItemSwitchWidget(
      {this.title,
      this.isEnabled = true,
      this.onPress,
      this.fontSize = 16,
      this.latterSpacing = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(!isEnabled),
      child: Container(
        height: SizeConfig.relativeHeight(5),
        // width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Opacity(
                    opacity: 0.5,
                    child: Text(title,
                    style: TextStyle(
                        fontFamily: AppTheme.ffRegular,
                        color: Colors.black,
                        fontSize: SizeConfig.setSp(fontSize),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: latterSpacing)))),
            AppSwitch(isEnabled:isEnabled,onChange: (isEnabled)=> onPress(isEnabled),),

          ],
        ),
      ),
    );
  }
}
