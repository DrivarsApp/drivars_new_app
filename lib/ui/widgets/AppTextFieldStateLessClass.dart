import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;

  AppTextField(this.textEditingController, this.hint);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle(
        fontFamily: 'Celias',
        color: AppColors.black,
        fontSize: SizeConfig.setSp(14),
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
        labelText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Celias',
          color: AppColors.hintTextColor,
          fontSize: SizeConfig.setSp(14),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
