import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_divider.dart';

class ProfileFieldWidget extends StatelessWidget {
  final String title;
  final String value;
  Widget trailingWidget;
  final Function onPress;
  final bool showGreenTick;

  ProfileFieldWidget(
      {this.title,
      this.value,
      this.onPress,
      this.trailingWidget,
      this.showGreenTick = false});

  Widget build(BuildContext context) {
    if (trailingWidget == null) {
      trailingWidget = Container(
        height: 0,
        width: 0,
      );
    }
    return InkWell(
      onTap: () => onPress(),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizeConfig.verticalSpacer(1.48),

                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: AppTheme.ffRegular,
                          color: Colors.black,
                          fontSize: SizeConfig.setSp(10),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    SizeConfig.verticalSpacer(0.61),
                    showGreenTick ? Row(children: <Widget>[
                      valueWidget(),
                      SizeConfig.horizontalSpacer(1.5),
                      SvgPicture.asset(AppTheme.iconChecked)
                    ],) : valueWidget(),
                    SizeConfig.verticalSpacer(1.72),


                    /*Row(
                        children: <Widget>[
                          Expanded(
                            child: valueWidget(),
                          ),

                        ],),*/


                  ],

                ),
              ),
              trailingWidget == null ? Container() : trailingWidget
            ],
          ),
          AppDivider(
            height: 2,
          ),
        ],
      ),
    );
  }

  valueWidget() {
    return Text(
      value,
      style: TextStyle(
        fontFamily: AppTheme.ffRegular,
        color: Colors.black,
        fontSize: SizeConfig.setSp(14),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: 1,
      ),
    );
  }
}
