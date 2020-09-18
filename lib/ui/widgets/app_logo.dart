import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class AppLogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'GO',
        style: TextStyle(
          fontSize: SizeConfig.setSp(26),
          fontFamily: AppTheme.lemonMilkMedium,
          color: AppColors.goLogoColor,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0, 1.0),
              blurRadius: 5.0,
              color: Colors.black26,
            ),
          ],
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'GAME',
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 1.0),
                    blurRadius: 5.0,
                    color: Colors.black26,
                  ),
                ],
                fontSize: SizeConfig.setSp(26),
                fontFamily: AppTheme.lemonMilkMedium,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
