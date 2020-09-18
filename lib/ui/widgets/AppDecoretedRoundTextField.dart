import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class AppDecoretedRoundTextField extends StatelessWidget {
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
  final IconData suffixIcon;
  final Color suffixIconColor;
  final Function suffixIconCallBack;

  AppDecoretedRoundTextField(
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
    this.suffixIcon,
    this.suffixIconCallBack,
    this.suffixIconColor,
  });

  Widget build(BuildContext context) {
    return /*Container(
//      height: SizeConfig.relativeHeight( 5.91),
      padding: EdgeInsets.only(
        left: SizeConfig.relativeWidth(2.66),
        bottom: SizeConfig.relativeWidth(0)
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: AppColors.textFieldBorderColor, width: 1),
          color: AppColors.textFieldBgColor),
      child: */TextFormField(
        textCapitalization: textCapitalization,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
//        onSubmitted: (String value) => onSubmitted(value),
        minLines: 1,
        maxLines: 3,
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

          suffixIcon: InkWell(
            child: Icon(
              suffixIcon,
              color: suffixIconColor,
            ),
            onTap: suffixIconCallBack,
          ),
          contentPadding: EdgeInsets.only(left: SizeConfig.relativeHeight(2.66),top: SizeConfig.relativeHeight(1) ,bottom: SizeConfig.relativeHeight(1) ),
          hintText: hint,
//          border: InputBorder.none,
//          focusedBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          ),
//          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(
            fontFamily: AppTheme.ffCelias,
            color: AppColors.hintTextColor,
            fontSize: SizeConfig.setSp(14),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
//      ),
    );
  }
}
