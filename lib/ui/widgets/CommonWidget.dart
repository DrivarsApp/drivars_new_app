import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';
import 'package:gogame/ui/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class CommaonWidget extends StatelessWidget with BaseCommonWidget {
  final dynamic label;
  final String rightAssets;
  final String leftAssets;
  final Function onTapFunction;

  CommaonWidget(
      {this.label, this.rightAssets, this.leftAssets, this.onTapFunction});

  build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: SizeConfig.relativeHeight(7.63),
        width: SizeConfig.relativeWidth(100),
        child: Column(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Image.asset(
                    leftAssets,
                    height: SizeConfig.relativeWidth(5.25),
                    width: SizeConfig.relativeWidth(5.25),
                  ),
                  onTap: onTapFunction,
                ),
                SizeConfig.horizontalSpacer(5.84),
                // Settings
                Container(
                  width: SizeConfig.relativeWidth(79.73),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(label,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: SizeConfig.setSp(14),
                          ),
                          textAlign: TextAlign.left),
                      // SizeConfig.horizontalSpacer(63.45),
                      Image.asset(
                        rightAssets,
                        height: SizeConfig.relativeHeight(1.20),
                        width: SizeConfig.relativeWidth(1.33),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              child: AppDivider(),
              padding: EdgeInsets.only(top: SizeConfig.relativeHeight(2.70)),
            )
          ],
        ),
      ),
      InkWell(
        child: Container(
          height: SizeConfig.relativeHeight(7.63),
          width: SizeConfig.relativeWidth(100),
        ),
        onTap: onTapFunction,
      )
    ]);
  }
}
