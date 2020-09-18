import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPreferenceItem extends StatelessWidget {
  final String title;
  final String image;
  final String cardDetails;
  final String addNewMessage;

  PaymentPreferenceItem({this.title,this.image,this.cardDetails,this.addNewMessage});
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizeConfig.verticalSpacer(2.71),
          Row(
            children: <Widget>[
              SizeConfig.horizontalSpacer(6.66),

              Opacity(
                opacity: 0.5,
                child: Text(title,
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: Colors.black,
                      fontSize: SizeConfig.setSp(14),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 1,

                    )
                ),
              ),
            ],
          ),
          SizeConfig.verticalSpacer(1.97),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: SizeConfig.relativeWidth(6.5),right: SizeConfig.relativeWidth(6.5)),
            padding: EdgeInsets.only(left: SizeConfig.relativeWidth(4.8)),

            height: SizeConfig.relativeHeight(7),
            decoration: new BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                  color: Color(0x7fd8d8d8),
                  offset: Offset(0,2),
                  blurRadius: 16,
                  spreadRadius: 0
              ) ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(image,width: SizeConfig.relativeWidth(16),
                  height: SizeConfig.relativeHeight(3.69),),
                SizeConfig.horizontalSpacer(5.33),

                Text(cardDetails,
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: AppTheme.text6Color,
                      fontSize: SizeConfig.setSp(16),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0,

                    )
                )
              ],),

          ),
          SizeConfig.verticalSpacer(1.97),
          Row(children: <Widget>[
            SizeConfig.horizontalSpacer(6.66),

            SvgPicture.asset(AppTheme.iconAddRound,width: SizeConfig.relativeWidth(5.86),
              height: SizeConfig.relativeWidth(5.86),),
            SizeConfig.horizontalSpacer(2.66),
            Text(addNewMessage,
                style: TextStyle(
                  fontFamily: AppTheme.ffRegular,
                  color: AppTheme.plRedColor,
                  fontSize: SizeConfig.setSp(13),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1,

                )
            )

          ],)


        ],
      ),
    );
  }
}
