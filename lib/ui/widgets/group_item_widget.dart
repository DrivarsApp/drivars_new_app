import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class GroupItemWidget extends StatelessWidget {
  final String title;
  final String category;
  final String count;
  final Widget icon;
  final Function onPress;

  GroupItemWidget(
      {this.title, this.category, this.count, this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
          width: double.infinity,
//      height: SizeConfig.relativeHeight(17),
          margin: EdgeInsets.only(
              top: SizeConfig.relativeHeight(0.61),
              bottom: SizeConfig.relativeHeight(0.61)),
          padding: EdgeInsets.only(
              top: SizeConfig.relativeHeight(1.23),
              bottom: SizeConfig.relativeHeight(1.23),
              left: SizeConfig.relativeWidth(3.46),
              right: SizeConfig.relativeWidth(3.46)),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xfff2f2f2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: SizeConfig.relativeWidth(6.66),
                  height: SizeConfig.relativeWidth(6.66),
                  child: icon),
              SizeConfig.horizontalSpacer(2.93),
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppTheme.ffRegular,
                  color: AppTheme.text3Color,
                  fontSize: SizeConfig.setSp(14),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.1556154,
                ),
              ),
              SizeConfig.horizontalSpacer(1.5),
              Opacity(
                opacity: 0.6,
                child: Text(category == null ? '' : category,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: AppTheme.text8Color,
                      fontSize: SizeConfig.setSp(12),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.5,
                    )),
              ),
              Expanded(
                child: Container(),
              ),
              Text(count == null ? '' : count,
                  style: TextStyle(
                    fontFamily: AppTheme.ffRegular,
                    color: AppTheme.text8Color,
                    fontSize: SizeConfig.setSp(12),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.5,
                  ))
            ],
          )),
    );
  }
}
