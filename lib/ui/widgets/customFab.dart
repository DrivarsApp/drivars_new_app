import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/size_config.dart';

class CustomFab extends StatelessWidget {
  final Function onHomeTap;
  final Function onNotificationTap;
  final String homeIcon;
  final String notificationIcon;

  CustomFab(
      {@required this.onHomeTap,
      @required this.onNotificationTap,
      @required this.homeIcon,
      @required this.notificationIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: SizeConfig.relativeHeight(0.89),
        bottom: SizeConfig.relativeHeight(0.78),
      ),
//      height: SizeConfig.relativeHeight(4.49),
      width: SizeConfig.relativeWidth(29.26),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top:SizeConfig.relativeHeight(0.78),bottom: SizeConfig.relativeHeight(0.78) ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: onHomeTap,
                child: SvgPicture.asset(
                  homeIcon,
                  //ImagesPaths.iconHomeOpen,
                  width: SizeConfig.relativeWidth(5.55),
                  height: SizeConfig.relativeWidth(5.55),
                ),
              ),
              InkWell(
                onTap: onNotificationTap,
                child: SvgPicture.asset(
                  notificationIcon,
                  width: SizeConfig.relativeWidth(6.03),
                  height: SizeConfig.relativeWidth(6.03),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
