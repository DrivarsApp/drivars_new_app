import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditions extends StatelessWidget {
  final String text;
  final String linkText;
  final Function onPressed;

  const TermsAndConditions({this.text, this.linkText, this.onPressed});

  // const TermsAndConditions(this.text,
  //     {this.onPressed, this.textLinkTerms, this.textAnd, this.textPolicy, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w400,
              fontFamily: AppTheme.interRegular,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.setSp(12.0),
            ),
          ),
          InkWell(
            onTap: () => onPressed(),
            child: Text(
              linkText,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.blueColor,
                fontSize: SizeConfig.setSp(12),
                fontFamily: AppTheme.interBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

//  void launchURL(String urlText) async {
//    String url = urlText;
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
}
