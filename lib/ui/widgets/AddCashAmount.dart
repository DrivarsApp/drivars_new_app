import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class AddCashAmount extends StatelessWidget {
  AddCashAmount(
      {@required this.amount,
      @required this.benefit1,
      @required this.benefit2,
      @required this.onTap});

  final int amount;
  final int benefit1, benefit2;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeConfig.relativeHeight(9.21),
        width: SizeConfig.relativeWidth(44.12),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            SizeConfig.relativeWidth(2.43),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '\u{20B9}$amount',
                    style: TextStyle(
                      fontFamily: AppTheme.interExtraBold,
                      fontSize: SizeConfig.setSp(27),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        ImagesPaths.iconRupee,
                        width: SizeConfig.relativeWidth(3.86),
                        height: SizeConfig.relativeHeight(1.78),
                      ),
                      SizeConfig.horizontalSpacer(1),
                      Text(
                        '$benefit1% back',
                        style: TextStyle(
                          fontFamily: AppTheme.interExtraBold,
                          fontSize: SizeConfig.setSp(10),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        ImagesPaths.iconLightCoin,
                        width: SizeConfig.relativeWidth(3.86),
                        height: SizeConfig.relativeHeight(2.34),
                      ),
                      SizeConfig.horizontalSpacer(1),
                      Text(
                        '$benefit2 Extra',
                        style: TextStyle(
                          fontFamily: AppTheme.interExtraBold,
                          fontSize: SizeConfig.setSp(10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
