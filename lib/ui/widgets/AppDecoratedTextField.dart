import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

import 'AppTextField.dart';

class AppDecoratedTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
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
  // final Widget iconTovisibility;
  // final Function isPasswordVisibility;

  AppDecoratedTextField(
    this.textEditingController,
    this.hint, {
    this.onTextChange,
    this.focusNode,
    this.autoFocus = false,
    this.textInputAction,
    this.keyboardType,
    this.onEditingComplete,
    this.readOnly = false,
    this.onSubmitted,
    this.obscureText = false,
     this.textCapitalization = TextCapitalization.sentences,
    //  this.iconTovisibility,
    // this.isPasswordVisibility
  });

  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(5.91),
      padding: EdgeInsets.only(left: SizeConfig.relativeWidth(2.66)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
          color: AppColors.textFieldBgColor),
      child: AppTextField(
        textEditingController,
        hint,
        readOnly: readOnly,
        onTextChange: onTextChange,
        focusNode: focusNode,
        autoFocus: autoFocus,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        obscureText: obscureText,
        // suffixTovisibility: IconButton(icon: iconTovisibility, onPressed: isPasswordVisibility),
      ),
    );
  }
}
