import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class AppCustomButton extends StatelessWidget {
  final String title;
  final Function onPress;
  final bool isDisabled;

  AppCustomButton(this.title, {this.onPress, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        width: SizeConfig.relativeWidth(84.95),
        height: SizeConfig.relativeHeight(8.39),
        color: Colors.blue,
        decoration: new BoxDecoration(
            borderRadius:
                BorderRadius.circular(SizeConfig.relativeHeight(8.37) / 5)),
        child: Center(
          child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppTheme.interBold,
                fontSize: SizeConfig.setSp(16),
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
