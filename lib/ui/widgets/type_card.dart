import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class TypeCard extends StatelessWidget {
  final String buttonText;
  final Function onPress;
  final containerHeight;
  final containerWidth;
  final String imageName;

  TypeCard({
    this.buttonText,
    this.containerHeight,
    this.containerWidth,
    this.onPress,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress,
      child: Card(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                imageName,
                width: SizeConfig.relativeWidth(8.04),
                height: SizeConfig.relativeHeight(5.61),
              ),
              SizeConfig.verticalSpacer(1.12),
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
    );
  }
}
