import 'package:gogame/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double height;
  final Color color;

  AppDivider({this.height = 1,this.color = AppTheme.dividerColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
    );
  }
}
