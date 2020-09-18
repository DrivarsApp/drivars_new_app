import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxline;
  final bool editable;
  final Function onPress;
  final TextInputType inputType;
  final Widget suffixIconWidget;
  final Size suffixIconSize;
  TextEditingController controller;
  Color color;

  CustomTextField(this.hint,
      {this.maxline = 1,
      this.editable = true,
      this.onPress,
      this.suffixIconWidget,
      this.suffixIconSize = const Size(0, 0),
      this.controller,
      this.color,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    if (color == null) color = AppTheme.plRedColor;
    return InkWell(
      onTap: onPress,
      child: controller != null
          ? TextFormField(
              enabled: editable,
              maxLines: maxline == 0 ? null : maxline,
              controller: controller,
              keyboardType: inputType,
              style: valueStyle(),
              decoration: InputDecoration(
                labelText: hint,
                hintStyle: hintStyle(),
                border: borderWidget(AppTheme.textFieldUnderLineColor),
                disabledBorder: borderWidget(AppTheme.textFieldUnderLineColor),
                enabledBorder: borderWidget(AppTheme.textFieldUnderLineColor),
                focusedBorder: borderWidget(AppTheme.plRedColor),
                suffixIconConstraints: BoxConstraints.tight(suffixIconSize),
                suffixIcon:
                    suffixIconWidget == null ? Container() : suffixIconWidget,
                alignLabelWithHint: true,
                labelStyle: labelStyle(),
              ),
            )
          : TextFormField(
              enabled: editable,
              maxLines: maxline == 0 ? null : maxline,
              keyboardType: inputType,
              style: valueStyle(),
              decoration: InputDecoration(
                labelText: hint,
                hintStyle: hintStyle(),
                border: borderWidget(AppTheme.textFieldUnderLineColor),
                disabledBorder: borderWidget(AppTheme.textFieldUnderLineColor),
                enabledBorder: borderWidget(AppTheme.textFieldUnderLineColor),
                focusedBorder: borderWidget(AppTheme.plRedColor),
                suffixIconConstraints: BoxConstraints.tight(suffixIconSize),
                suffixIcon:
                    suffixIconWidget == null ? Container() : suffixIconWidget,
                alignLabelWithHint: true,
                labelStyle: labelStyle(),
              ),
            ),
    );
  }

  labelStyle() {
    return TextStyle(
      fontFamily: AppTheme.ffRegular,
      fontSize: SizeConfig.setSp(13),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }

  hintStyle() {
    return TextStyle(
      fontFamily: AppTheme.ffRegular,
      color: AppTheme.text7Color,
      fontSize: SizeConfig.setSp(13),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }

  valueStyle() {
    return TextStyle(
      fontFamily: AppTheme.ffRegular,
      fontSize: SizeConfig.setSp(16),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }
}

borderWidget(Color color) {
  return new UnderlineInputBorder(
      borderSide: new BorderSide(color: color, width: 1));
}
