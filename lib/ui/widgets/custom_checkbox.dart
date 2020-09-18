import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//TODO config the size
class CustomCheckBox extends StatelessWidget {
  final bool isChecked;

  CustomCheckBox({this.isChecked});

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Container(
              height: SizeConfig.relativeHeight(2.70),
              width: SizeConfig.relativeHeight(2.70),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(11)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x7fafb4c0),
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SvgPicture.asset(AppTheme.iconChecked),
                ),
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Container(
              height: SizeConfig.relativeHeight(2.70),
              width: SizeConfig.relativeHeight(2.70),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(22)),
                border: Border.all(
                  color: Color(0xffcfcfcf),
                  width: 0.7586206896551724,
                ),
              ),
            ),
          );
  }
}
