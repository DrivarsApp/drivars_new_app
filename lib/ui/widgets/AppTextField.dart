import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class AppTextField extends StatelessWidget {
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
  final IconData prefilx;
  final bool hasPrefix;

  AppTextField(
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
    this.textCapitalization = TextCapitalization.none,
    this.prefilx = Icons.phone_android,
    this.hasPrefix = false,
  });

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hint,
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppTheme.interBold,
                  fontSize: SizeConfig.setSp(18)),
              textAlign: TextAlign.center),
          TextField(
            textCapitalization: textCapitalization,
            readOnly: readOnly,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onEditingComplete: onEditingComplete,
            onSubmitted: (String value) => onSubmitted(value),
//          focusNode: focusNode,
            autofocus: autoFocus,
            textInputAction: textInputAction,
            onChanged: (String value) => onTextChange(value),
            controller: textEditingController,

            style: TextStyle(
              fontFamily: AppTheme.interRegular,
              color: AppColors.black,
              fontSize: SizeConfig.setSp(18),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              icon: hasPrefix
                  ? Icon(
                      prefilx,
                      color: Colors.black,
                      size: SizeConfig.relativeHeight(2.67),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
//              isCollapsed: false,
              hintText: hint,
              border: border(),
              focusedBorder: border(),
              enabledBorder: border(),
              errorBorder: border(),
              disabledBorder: border(),
              hintStyle: TextStyle(
                fontFamily: AppTheme.interRegular,
                color: AppColors.hintTextColor,
                fontSize: SizeConfig.setSp(18),
              ),
            ),
          ),
          Container(
            height: 2,
            color: AppColors.blueColor,
          ),
        ],
      ),
    );
  }

  border() {
    return InputBorder.none;
  }
}
