import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class CustomPlainTextField extends StatelessWidget {
  final int maxLine;
  final String hint;

  CustomPlainTextField({this.maxLine = 1, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine == 0 ? null : maxLine,
      style: TextStyle(
        fontFamily: AppTheme.ffRegular,
        fontSize: SizeConfig.setSp(16),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        border: borderWidget(AppTheme.textFieldUnderLineColor),
        disabledBorder: borderWidget(AppTheme.textFieldUnderLineColor),
        enabledBorder: borderWidget(AppTheme.textFieldUnderLineColor),
        hintText: hint,

        focusedBorder: borderWidget(AppTheme.plRedColor),
//          labelText: model.translate(add_group_description),
        hintStyle: TextStyle(
          fontFamily: AppTheme.ffRegular,
          color: AppTheme.text7Color,
          fontSize: SizeConfig.setSp(14),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.1,
        ),
      ),
    );
  }

  borderWidget(Color color) {
    return UnderlineInputBorder(borderSide: BorderSide.none);
  }
}
