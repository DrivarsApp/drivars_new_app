import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class UserNameSuggestion extends StatelessWidget {
  final Function onTap;
  final String suggestionText;

  UserNameSuggestion({this.onTap, this.suggestionText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.relativeHeight(3.37),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(
          SizeConfig.relativeWidth(1.2),
          SizeConfig.relativeHeight(0.5),
          SizeConfig.relativeWidth(1.2),
          SizeConfig.relativeHeight(0.5),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              SizeConfig.relativeWidth(2.43),
            ),
            bottomRight: Radius.circular(
              SizeConfig.relativeWidth(2.43),
            ),
          ),
          gradient: LinearGradient(
              colors: AppColors.blueGradientColors,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Text(
          suggestionText,
          style: TextStyle(
            fontFamily: AppTheme.interRegular,
            fontSize: SizeConfig.setSp(15),
          ),
        ),
      ),
    );
  }
}
