import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final maximumLines;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;

  const InputTextField(
      {this.textController,
      this.hint,
      this.maximumLines,
      this.textCapitalization,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.relativeWidth(2.14),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.relativeWidth(3.65),
        ),
        child: TextField(
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.justify,
          maxLines: maximumLines,
          controller: textController,
          style: TextStyle(
            fontFamily: AppTheme.interRegular,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: AppTheme.interRegular,
              color: AppColors.hintTextColor,
            ),
            border: border(),
          ),
        ),
      ),
    );
  }

  border() {
    return InputBorder.none;
  }
}
