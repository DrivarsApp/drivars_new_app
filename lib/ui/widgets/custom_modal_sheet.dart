import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class CustomModalSheet extends StatelessWidget {
  final String title;
  final String viewText;
  final IconData viewIcon;
  final IconData uploadIcon;
  final IconData removeIcon;
  final String uploadText;
  final String removeText;
  final String footerText;
  final Function onTapView;
  final Function onTapUpload;
  final Function onTapRemove;

  const CustomModalSheet(
      {@required this.title,
      this.viewText,
      this.uploadText,
      this.removeText,
      this.viewIcon,
      this.uploadIcon,
      this.removeIcon,
      this.onTapView,
      this.onTapUpload,
      this.onTapRemove,
      this.footerText});

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
                    child: SvgPicture.asset(
                      ImagesPaths.iconExitBlue,
                      width: SizeConfig.relativeWidth(8.69),
                      height: SizeConfig.relativeWidth(8.69),
                    ),
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
                    onTap: onTapView,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(viewIcon),
                    title: Text(
                      viewText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(18),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: onTapUpload,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      uploadIcon,
                    ),
                    title: Text(
                      uploadText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(18),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: onTapRemove,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      removeIcon,
                    ),
                    title: Text(
                      removeText,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: AppTheme.interBold,
                        fontSize: SizeConfig.setSp(18),
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
