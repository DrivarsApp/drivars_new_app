import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final bool showSuffix;
  final bool readonly;
  final String helpText;
  final bool showHelperText;
  final TextInputType textInputType;

  const TextFieldCustom({
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
      child: TextField(
        cursorColor: AppColors.blackLight,
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
          suffixText: showSuffix ? 'CHANGE' : null,
          suffixStyle: TextStyle(
            fontFamily: AppTheme.interBold,
            fontSize: SizeConfig.setSp(8.0),
            color: AppColors.blueColor,
            fontStyle: FontStyle.normal,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.black,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.black,
            ),
          ),
          helperText: showHelperText ? helpText : null,
          helperStyle: TextStyle(
            fontFamily: AppTheme.interRegular,
            color: AppColors.blackLight,
            fontSize: SizeConfig.setSp(14.0),
          ),
          hintText: labelText,
          hintStyle: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: AppTheme.interRegular,
            fontSize: SizeConfig.setSp(16.0),
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
