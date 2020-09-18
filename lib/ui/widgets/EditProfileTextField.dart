import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class EditProfileTextField extends StatelessWidget {
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
  final bool focusBorderAvailable;
  final String label;

  // final InputDecoration decoration;
  // final Widget suffixTovisibility;
  // final Widget iconTovisibility;
  // final Function isPasswordVisibility;

  EditProfileTextField(
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
    this.textCapitalization,
    this.focusBorderAvailable = false,
    this.label,
    // this.decoration,
    // this.suffixTovisibility,
    // this.iconTovisibility,
    // this.isPasswordVisibility
  });

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.relativeHeight(1.23)),
      child: TextFormField(
        textCapitalization: textCapitalization,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
//          onSubmitted: (String value) => onSubmitted(value),
//        focusNode: focusNode,
        autofocus: autoFocus,

        textInputAction: textInputAction,
        onChanged: (String value) => onTextChange(value),
        controller: textEditingController,
        style: TextStyle(
          fontFamily: AppTheme.ffCelias,
          color: AppColors.black,
          fontSize: SizeConfig.setSp(14),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 1, bottom: 1),
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(
              color: AppColors.textFieldBorderColor,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.setSp(14)),

          // suffixIcon: suffixTovisibility,
          // IconButton(icon: iconTovisibility, onPressed: isPasswordVisibility),
          border: focusBorderAvailable
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.hintTextColor))
              : InputBorder.none,
          focusedBorder: focusBorderAvailable
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.hintTextColor))
              : InputBorder.none,
          enabledBorder: focusBorderAvailable
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.hintTextColor))
              : InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: focusBorderAvailable
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.hintTextColor))
              : InputBorder.none,
          hintStyle: TextStyle(
            fontFamily: AppTheme.ffCelias,
            color: AppColors.profileTextFiledHint,
            fontSize: SizeConfig.setSp(14),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
