import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class UserInput extends StatelessWidget {
  final TextEditingController inputTextEditingController;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Function onSubmitted;
  final Function onPress;
  final IconData suffixIcon;
  final bool readOnly;
  final Function onChanged;

  const UserInput(
      {Key key,
      this.inputTextEditingController,
      this.hintText,
      this.textInputAction,
      this.keyboardType,
      this.onSubmitted,
      this.suffixIcon, 
      this.onPress, this.readOnly, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        textInputAction: textInputAction,
        controller: inputTextEditingController,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onChanged: onChanged,
        onSubmitted: (String value) => onSubmitted(value),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(suffixIcon,color: Colors.grey,),
            onPressed: onPress,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: AppTheme.interRegular,
            fontSize: SizeConfig.setSp(18),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                SizeConfig.relativeWidth(2.43),
              ),
            ),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                SizeConfig.relativeWidth(2.43),
              ),
            ),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
