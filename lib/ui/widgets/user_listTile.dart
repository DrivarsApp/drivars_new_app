import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class UserListTile extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final String imageName;
  final bool showTrailingIcon;
  final Function onTap;

  UserListTile(this.titleText, this.subtitleText, this.imageName,
      [this.showTrailingIcon = false, this.onTap]);

  @override
  Widget build(BuildContext context) {
    print('image anme ==> $imageName');
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: imageName,
          height: SizeConfig.relativeHeight(7.25),
          width: SizeConfig.relativeHeight(7.25),
          fit: BoxFit.fill,
        ),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: AppTheme.interExtraBold,
          fontSize: SizeConfig.setSp(22),
        ),
      ),
      subtitle: Text(
        subtitleText,
        style: TextStyle(
          color: Colors.black,
          fontFamily: AppTheme.interRegular,
          fontSize: SizeConfig.setSp(20),
        ),
      ),
      trailing: showTrailingIcon
          ? IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.close,
              ),
            )
          : null,
    );
  }
}
