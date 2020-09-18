import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/widgets/round_icon_widget.dart';
import 'package:flutter/material.dart';

class InboxItemWidget extends StatelessWidget {

  final String title;
  final String time;
  final String message;
  final String icon;

  InboxItemWidget({this.title,this.time,this.message,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
//      height: SizeConfig.relativeHeight(17),
      padding: EdgeInsets.only(
          left: SizeConfig.relativeWidth(4.47),
          right: SizeConfig.relativeWidth(2.4),
          top: SizeConfig.relativeHeight(1.60),
          bottom: SizeConfig.relativeHeight(1.60)),
      margin: EdgeInsets.only(
          top: SizeConfig.relativeHeight(1.23),
          bottom: SizeConfig.relativeHeight(1.23),
          left: SizeConfig.relativeWidth(6.93),
          right: SizeConfig.relativeWidth(6.93)),
      decoration: new BoxDecoration(
        color: AppTheme.cardBgGrayColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Color(0xffe6e6e6),
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            RoundIconWidget(circleSize: 20,iconWidth:10.5,iconHeight:8,radius: 20,icon: icon ,),
            SizeConfig.horizontalSpacer(2.93),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(title,
                style: TextStyle(
                  fontFamily: AppTheme.ffBold,
                  color:AppTheme.text1Color,
                  fontSize: SizeConfig.setSp(15),
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),),
              SizeConfig.verticalSpacer(0.5),
              Text(time,
                  style: TextStyle(
                    fontFamily: AppTheme.ffRegular,
                    color:AppTheme.text7Color,
                    fontSize: SizeConfig.setSp(12),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )
              )
            ],)
          ],),
          SizeConfig.verticalSpacer(1),
          Row(
            children: <Widget>[
              SizeConfig.horizontalSpacer(1.5),

              Expanded(
                child: Text(message,
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: AppTheme.text1Color,
                      fontSize: SizeConfig.setSp(13),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,


                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
