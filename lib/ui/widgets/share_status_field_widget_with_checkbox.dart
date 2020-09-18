import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/widgets/custom_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_divider.dart';

class ShareStatusFieldCheckedBoxWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isSelected;

  ShareStatusFieldCheckedBoxWidget({this.title, this.value,this.isSelected});

  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Row(
          children:<Widget>[
            Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizeConfig.verticalSpacer(1),

                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTheme.ffRegular,
                    color: AppTheme.text7Color,
                    fontSize: SizeConfig.setSp(14),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),

                SizeConfig.verticalSpacer(0.61),


                Opacity(
                  opacity: 0.5,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: AppTheme.text7Color,
                      fontSize: SizeConfig.setSp(14),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.13,
                    ),
                  ),
                ),
                SizeConfig.verticalSpacer(1.23),

              ],

            ),
          ),
            CustomCheckBox(isChecked: isSelected,)
          ],
        ),
        AppDivider(height: 2,),
        SizeConfig.verticalSpacer(1.83),


      ],
    );
  }
}
