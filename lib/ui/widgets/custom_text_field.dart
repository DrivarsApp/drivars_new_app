import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Function onTextChange;
  final FocusNode focusNode;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final VoidCallback onEditingComplete;
  final TextInputType keyboardType;
  final Function onSubmitted;
  final bool readOnly;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final Widget suffixIcon;
  final Function onPress;
  final bool hasPrefix;
  final bool enableValue;
  final Function onTextFieldTap;

  CustomTextField({
    this.textEditingController,
    this.hintText,
    this.onTextChange,
    this.focusNode,
    this.autoFocus = false,
    this.textInputAction,
    this.keyboardType,
    this.onEditingComplete,
    this.readOnly = false,
    this.onSubmitted,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.hasPrefix = false,
    this.suffixIcon,
    this.onPress,
    this.enableValue = true,
    this.onTextFieldTap,
  });

  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(6.05),
      padding: EdgeInsets.zero,
      child: TextField(
        onTap: onTextFieldTap,
        enabled: enableValue,
        textCapitalization: textCapitalization,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        onSubmitted: (String value) => onSubmitted(value),
        autofocus: autoFocus,
        textInputAction: textInputAction,
        onChanged: (String value) => onTextChange(value),
        controller: textEditingController,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontFamily: AppTheme.interBold,
          fontSize: SizeConfig.setSp(20),
        ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: suffixIcon,
          ),
          border: border(),
          focusedBorder: border(),
          enabledBorder: border(),
          errorBorder: border(),
          disabledBorder: border(),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: AppTheme.interBold,
            fontSize: SizeConfig.setSp(20),
          ),
        ),
      ),
    );
  }

  border() {
    return InputBorder.none;
  }
}
