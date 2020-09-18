import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItemWithPrefixIconWidget extends StatelessWidget {
  final String title;
  final Function onPress;
  final String selectedType;
  final String prefixIcon;

  CustomItemWithPrefixIconWidget(
      {this.title, this.onPress, this.selectedType, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        height: SizeConfig.relativeHeight(8.37),
        // width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                      height: SizeConfig.relativeWidth(5.29),
                      width: SizeConfig.relativeWidth(5.29),
                      child: SvgPicture.asset(prefixIcon)),
                  SizeConfig.horizontalSpacer(2.5),
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
            AppDivider(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
