import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';

class OfferListItem extends StatelessWidget {
  //const OfferListItem({Key key}) : super(key: key);

  final String title;
  final String smallTitle;
  final String description;
  final String currency;
  final int amount;
  final String iconUrl;
  final Function onTap;

  //All values are relative to Screen size
  final double iconSize = 12;
  final double height = 15;
  final double titleFontSize = SizeConfig.setSp(14);
  final double textSize = SizeConfig.setSp(12);

  OfferListItem(
      {Key key,
      this.title,
      this.smallTitle,
      this.description,
      this.currency,
      this.amount,
      this.iconUrl,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0x7fe3e3e3),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0)
          ],
        ),
        width: SizeConfig.relativeWidth(90),
        padding: EdgeInsets.only(
            bottom: SizeConfig.relativeHeight(1),
            top: SizeConfig.relativeHeight(1),
            left: SizeConfig.relativeWidth(3),
            right: SizeConfig.relativeWidth(3)),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: SizeConfig.relativeHeight(5),
                  height: SizeConfig.relativeHeight(5),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(iconUrl),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizeConfig.horizontalSpacer(2),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: AppTheme.ffBold,
                          color: Color(0xff303030),
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizeConfig.verticalSpacer(0.2),
                      Text(smallTitle,
                          style: TextStyle(
                            fontFamily: AppTheme.ffRegular,
                            color: Color(0xff303030),
                            fontSize: textSize,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      SizeConfig.verticalSpacer(1),
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: currency,
                      style: TextStyle(
                        fontFamily: AppTheme.ffRegular,
                        color: Color(0xff858585),
                        fontSize: SizeConfig.setSp(10),
                      )),
                  TextSpan(
                      text: '${AppTheme.nubmerFormat2.format(amount)}',
                      style: TextStyle(
                        fontFamily: AppTheme.ffBold,
                        color: Color(0xffd0021b),
                        fontSize: SizeConfig.setSp(18),
                      )),
                ]))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: SizeConfig.relativeHeight(5),
                  height: SizeConfig.relativeHeight(5),
                ),
                SizeConfig.horizontalSpacer(2),
                Container(
                  //padding:  EdgeInsets.only(right:8.0),
                  width: SizeConfig.relativeWidth(60),
                  child: Text(
                    description,
                    style: TextStyle(
                        fontFamily: AppTheme.ffRegular,
                        color: Color(0xff303030),
                        fontSize: textSize,
                        height: 1.5),
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
