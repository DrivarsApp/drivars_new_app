import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/images.dart';

class BottomModalSheet extends StatelessWidget {
  final String titleText;
  final String termText;

  final List<Info> myInfo;

  const BottomModalSheet({this.termText, this.titleText, this.myInfo});

  Widget _listTerms(int index) {
    return
//      ListTile(
//      contentPadding: EdgeInsets.zero,
//      dense: true,
//      leading: Text(
//        '${index + 1}. ',
//        style: TextStyle(
//          fontSize: SizeConfig.setSp(19),
//          fontFamily: AppTheme.interRegular,
//        ),
//      ),
//      title: Text(
//        myInfo[index].description,
//        style: TextStyle(
//          fontSize: SizeConfig.setSp(19),
//          fontFamily: AppTheme.interRegular,
//        ),
//      ),
//    );
        Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${index + 1}. ',
          style: TextStyle(
            fontSize: SizeConfig.setSp(19),
            fontFamily: AppTheme.interRegular,
          ),
        ),
        Text(
          myInfo[index].description,
          style: TextStyle(
            fontSize: SizeConfig.setSp(19),
            fontFamily: AppTheme.interRegular,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: SizeConfig.relativeHeight(44.94),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.relativeHeight(4.46),
                    left: SizeConfig.relativeWidth(5.60),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: SizeConfig.setSp(22),
                      fontFamily: AppTheme.interBold,
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: SizeConfig.relativeHeight(4.46),
                        right: SizeConfig.relativeWidth(4.46),
                      ),
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        ImagesPaths.iconExitBlue,
                        width: SizeConfig.relativeWidth(8.69),
                        height: SizeConfig.relativeWidth(8.69),
                      ),
                    ),
                  ),
                ),
                //SizeConfig.verticalSpacer(1.78),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: SizeConfig.relativeWidth(5.60),
                right: SizeConfig.relativeWidth(5.60),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizeConfig.verticalSpacer(1.78),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: myInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _listTerms(index);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizeConfig.verticalSpacer(1.79),
                  ),
                  SizeConfig.verticalSpacer(1.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info {
  String description;
  Info(this.description);
}
