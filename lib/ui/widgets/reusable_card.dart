import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class ImageCard extends StatelessWidget {
  final Function onPress;
  //final String imageName;
  final String buttonText;
  final containerHeight;
  final containerWidth;
  final String iconName;
  //final imageHeight;
  //final imageWidth;

  ImageCard({
    this.onPress,
    this.buttonText,
    // this.imageName,
    // this.imageHeight,
    // this.imageWidth,
    this.containerHeight,
    this.containerWidth,
    this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  iconName,
                  width: SizeConfig.relativeWidth(8.45),
                  height: SizeConfig.relativeWidth(8.45),
                ),
                SizeConfig.horizontalSpacer(2.53),
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
