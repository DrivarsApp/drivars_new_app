import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class ItalicText extends StatelessWidget {
  final String text;
  final num fontSize;
  ItalicText(this.text,{this.fontSize=11});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Text( text,
          style: TextStyle(
            fontFamily: AppTheme.ffRegular,
            color: AppTheme.text8Color,
            fontSize: SizeConfig.setSp(fontSize),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            letterSpacing: 0.3,

          )
      ),
    );
  }
}
