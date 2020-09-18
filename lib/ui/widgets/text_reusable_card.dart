import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class TextCard extends StatelessWidget {
  final Function onPress;

  final String buttonText;
  final containerHeight;
  final containerWidth;

  TextCard({
    this.onPress,
    this.buttonText,
    this.containerHeight,
    this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              SizeConfig.relativeWidth(4.14),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  buttonText,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: AppTheme.interBold,
                    fontSize: SizeConfig.setSp(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
