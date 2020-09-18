import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class TournamentCardData extends StatelessWidget {
  final String imageName;
  final String title;

  TournamentCardData({@required this.imageName, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(
          imageName,
          width: SizeConfig.relativeWidth(4.87),
          height: SizeConfig.relativeHeight(2.24),
        ),
        SizeConfig.horizontalSpacer(2.43),
        Text(
          title,
          style: TextStyle(
            fontSize: SizeConfig.setSp(12),
            fontFamily: AppTheme.interExtraBold,
          ),
        ),
      ],
    );
  }
}
