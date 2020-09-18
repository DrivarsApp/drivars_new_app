import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessFailureText extends StatelessWidget {
  const SuccessFailureText({Key key, this.success = true, this.text})
      : super(key: key);
  final bool success;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(4.5),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            AppTheme.iconChecked,
            height: SizeConfig.relativeHeight(2.2),
            width: SizeConfig.relativeHeight(2.2),
          ),
          SizeConfig.horizontalSpacer(3),
          SizedBox(
            width: SizeConfig.relativeWidth(55),
            child: Text(text,
                style: TextStyle(
                  fontFamily: AppTheme.ffBold,
                  color: Color(0xff7ed321),
                  fontSize: SizeConfig.setSp(13),
                )),
          )
        ],
      ),
    );
  }
}
