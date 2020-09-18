import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemWidget extends StatelessWidget {
  final String title;
  final Function onPress;
  final String selectedType;
  final bool hasDivider;
  final double height;

  CustomItemWidget(
      {this.title,
      this.onPress,
      this.selectedType,
      this.hasDivider = false,
      this.height = 5.29});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        height: SizeConfig.relativeHeight(height),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(

                //                   <--- left side
                color: AppTheme.dividerColor,
                style: hasDivider ? BorderStyle.solid : BorderStyle.none,
                width: SizeConfig.relativeHeight(0.24)),
          ),
        ),

        // width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Opacity(
              opacity: 0.6,
              child: Text(title,
                  style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: AppTheme.text8Color,
                      fontSize: SizeConfig.setSp(16),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0)),
            )),
            selectedType == null
                ? Container()
                : Opacity(
                    opacity: 0.6,
                    child: Text(selectedType,
                        style: TextStyle(
                            fontFamily: AppTheme.ffRegular,
                            color: Colors.grey,
                            fontSize: SizeConfig.setSp(16),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0)),
                  ),
            SizeConfig.horizontalSpacer(2.66),
            SvgPicture.asset(AppTheme.iconRightAngle),
          ],
        ),
      ),
    );
  }
}
