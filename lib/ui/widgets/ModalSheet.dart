import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class ModalSheet extends StatelessWidget {
  final String title;
  final String viewText;
  final String subtitleText;
  final String viewIcon;
  final String nonBufferText;
  final String nonBufferSubtitleText;
  final String nonBufferIcon;
  final String registerText;
  final String registerSubtitleText;
  final String registerIcon;
  final String preText;
  final String preSubtitleText;
  final String preIcon;
  final String footerText;

  const ModalSheet(
      {Key key,
      this.title,
      this.viewText,
      this.viewIcon,
      this.footerText,
      this.subtitleText,
      this.nonBufferText,
      this.nonBufferSubtitleText,
      this.nonBufferIcon,
      this.registerText,
      this.registerSubtitleText,
      this.registerIcon,
      this.preText,
      this.preSubtitleText,
      this.preIcon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
//      height: SizeConfig.relativeHeight(38.28),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: SizeConfig.relativeWidth(6.34),
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: SizeConfig.setSp(22),
                      fontFamily: AppTheme.interExtraBold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: SizeConfig.relativeHeight(2),
                      right: SizeConfig.relativeWidth(6.34),
                    ),
                    alignment: Alignment.centerRight,
//                    child: SvgPicture.asset(
//                      ImagesPaths.iconExitBlue,
//                      width: SizeConfig.relativeWidth(8.69),
//                      height: SizeConfig.relativeWidth(8.69),
//                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: SizeConfig.relativeWidth(5.60),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      viewIcon,
                      width: SizeConfig.relativeWidth(11.11),
                      height: SizeConfig.relativeWidth(11.11),
                    ),
                    title: Text(
                      viewText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                    subtitle: Text(
                      subtitleText,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: AppTheme.interRegular,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      nonBufferIcon,
                      width: SizeConfig.relativeWidth(11.11),
                      height: SizeConfig.relativeWidth(11.11),
                    ),
                    title: Text(
                      nonBufferText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                    subtitle: Text(
                      nonBufferSubtitleText,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: AppTheme.interRegular,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      registerIcon,
                      width: SizeConfig.relativeWidth(7.11),
                      height: SizeConfig.relativeWidth(7.11),
                    ),
                    title: Text(
                      registerText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                    subtitle: Text(
                      registerSubtitleText,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: AppTheme.interRegular,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      preIcon,
                      width: SizeConfig.relativeWidth(9.11),
                      height: SizeConfig.relativeWidth(9.11),
                    ),
                    title: Text(
                      preText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                    subtitle: Text(
                      preSubtitleText,
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: AppTheme.interRegular,
                        fontSize: SizeConfig.setSp(19),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      footerText,
                      style: TextStyle(
                          fontSize: SizeConfig.setSp(9),
                          fontFamily: AppTheme.interRegular,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            SizeConfig.verticalSpacer(1.5),
          ],
        ),
      ),
    );
  }
}
