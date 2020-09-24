import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gogame/constants/API.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/views/BaseCommonWidget.dart';

class TournamentDetailsHeader extends StatelessWidget with BaseCommonWidget {
  final String image, gameName, gameDescription;
  TournamentDetailsHeader({this.image, this.gameName, this.gameDescription});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.relativeHeight(48.66),
      width: double.infinity,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
//          Image.asset(
//            ImagesPaths.nightGif,
//            height: double.infinity,
//            width: double.infinity,
//            fit: BoxFit.fill,
//          ),
          PositionedDirectional(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
//                icon: SvgPicture.asset(
//                  ImagesPaths.iconRoundBackArrow,
//                  width: SizeConfig.relativeWidth(8.45),
//                  height: SizeConfig.relativeWidth(8.45),
//                  color: AppColors.whiteColor,
//                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.relativeHeight(24.77),
            ),
            color: Colors.transparent.withOpacity(0.4),
            height: double.infinity,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: SizeConfig.relativeWidth(29.22),
                  width: SizeConfig.relativeWidth(29.22),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.relativeWidth(6.58),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: API.imageAddress + image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizeConfig.verticalSpacer(1),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '$gameName\n',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.setSp(28),
                        fontFamily: AppTheme.interExtraBold,
                        color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: gameDescription,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: SizeConfig.setSp(16),
                            fontFamily: AppTheme.interRegular,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizeConfig.verticalSpacer(5.58),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
