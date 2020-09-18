import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedBorderContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color bgColor;

  const DottedBorderContainer(
      {Key key,
      this.child,
      this.height = 7.3,
      this.width = double.infinity,
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(5),
      color: AppTheme.plRedColor,
      dashPattern: [SizeConfig.relativeWidth(1.5)],
      strokeWidth: 1,
      child: Container(
        padding: EdgeInsets.only(
            left: SizeConfig.relativeWidth(5),
            right: SizeConfig.relativeWidth(5)),
        width: width,
        color: bgColor,
        height: SizeConfig.relativeHeight(height),
        child: child,
      ),
    );
  }
}
