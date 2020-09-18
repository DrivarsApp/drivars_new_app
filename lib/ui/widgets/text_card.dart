import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class FilterTextCard extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final containerHeight;
  final containerWidth;

  FilterTextCard({
    this.buttonText,
    this.containerHeight,
    this.containerWidth,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //splashColor: Colors.lightBlue,
      onTap: () => onPress,
      child: Card(
        borderOnForeground: true,
        elevation: 1,
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              SizeConfig.relativeWidth(2.43),
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
                    fontSize: SizeConfig.setSp(19),
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
