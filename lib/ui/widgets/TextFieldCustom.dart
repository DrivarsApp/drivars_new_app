import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final String HintText;

  final bool showSuffix;
  final bool readonly;
  final String helpText;
  final bool showHelperText;
  final TextInputType textInputType;

  const TextFieldCustom({
    this.HintText,
    this.textController,
    this.labelText,
    this.showSuffix = false,
    this.readonly = false,
    this.helpText,
    this.showHelperText = false,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(6.36),
      width: SizeConfig.relativeWidth(42.83),
      child: TextField(
        cursorColor: AppColors.black,
        controller: textController,
        readOnly: readonly,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: AppTheme.interBold,
          fontSize: SizeConfig.setSp(16.0),
          color: AppColors.black,
        ),
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: HintText,
          hintStyle: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: AppTheme.interRegular,
            fontSize: SizeConfig.setSp(16.0),
            color: AppColors.black,
          ),
          filled: true,
          fillColor: AppColors.white,
          suffixText: showSuffix ? 'CHANGE' : null,
          suffixStyle: TextStyle(
            fontFamily: AppTheme.interBold,
            fontSize: SizeConfig.setSp(8.0),
            color: AppColors.blueColor,
            fontStyle: FontStyle.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          //   helperText: showHelperText ? helpText : null,
//          helperStyle: TextStyle(
//            fontFamily: AppTheme.interRegular,
//            color: AppColors.black,
//            fontSize: SizeConfig.setSp(12),
//          ),
//          labelText: labelText,
//          labelStyle: TextStyle(
//            decoration: TextDecoration.none,
//            fontFamily: AppTheme.interRegular,
//            fontSize: SizeConfig.setSp(16.0),
//            color: AppColors.black,
//          ),
        ),
      ),
    );
  }
}
