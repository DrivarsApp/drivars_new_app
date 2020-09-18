import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class CustomFieldHeader extends StatelessWidget {
  const CustomFieldHeader(this.title, {Key key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(title,
          style: TextStyle(
            fontFamily: AppTheme.ffRegular,
            color: Color(0xffa4a4a4),
            fontSize: SizeConfig.setSp(13),
          )),
    );
  }
}
