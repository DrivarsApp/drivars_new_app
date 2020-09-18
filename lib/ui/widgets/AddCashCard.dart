import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class AddCashCard extends StatelessWidget {
  AddCashCard(this.title, this.subtitle,
      {this.showButton = false, this.onTap, this.onPress});

  final String title;
  final String subtitle;
  final bool showButton;
  final Function onTap;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.relativeWidth(6.09),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(
          SizeConfig.relativeWidth(2.43),
        ),
//        height: SizeConfig.relativeHeight(9.43),
        width: SizeConfig.relativeWidth(96.58),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '$title',
                      style: TextStyle(
                        fontFamily: AppTheme.interRegular,
                        fontSize: SizeConfig.setSp(16),
                      ),
                    ),
                    InkWell(
                      onTap: onPress,
                      child: Icon(
                        Icons.info_outline,
                        size: SizeConfig.relativeWidth(4),
                      ),
                    ),
                  ],
                ),
                Text(
                  '\u{20B9}$subtitle',
                  style: TextStyle(
                      fontSize: SizeConfig.setSp(23),
                      fontFamily: AppTheme.interExtraBold),
                ),
              ],
            ),
            showButton
                ? InkWell(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.all(
                        SizeConfig.relativeWidth(2),
                      ),
//                      height: SizeConfig.relativeHeight(7.52),
                      width: SizeConfig.relativeWidth(31.46),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: AppColors.blueGradientColors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.relativeWidth(2.43),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.signOutAlt,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                'Withdraw',
                                style: TextStyle(
                                    fontFamily: AppTheme.interMedium,
                                    fontSize: SizeConfig.setSp(17),
                                    color: Colors.white),
                              ),
                              Text(
                                'Cash',
                                style: TextStyle(
                                    fontFamily: AppTheme.interMedium,
                                    fontSize: SizeConfig.setSp(17),
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
