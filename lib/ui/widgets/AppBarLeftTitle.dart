import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarLeftTitle extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize =
      Size.fromHeight(SizeConfig.relativeHeight(7.14)); //

  final String text;
  final bool defaultBackButton;
  final IconData leftIcon;
  final IconData rightIcon;
  final Function leftIconCallback;
  final Function rightIconCallback;
  final Color appBarColor;
  final double elevation;

  final String fontFamily;
  final Color textColor;
  final double fontSize;
  final dynamic fontWeight;
  final dynamic fontStyle;
  final dynamic letterSpacing;

  AppBarLeftTitle(
      {Key key,
        this.text,
        this.leftIcon,
        this.rightIcon,
        this.leftIconCallback,
        this.rightIconCallback,
        this.appBarColor = Colors.white,
        this.elevation = 0,
        this.defaultBackButton = true,
        this.fontFamily,
        this.fontSize,
        this.fontStyle,
        this.fontWeight,
        this.letterSpacing,
        this.textColor

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFAFAFA),
      titleSpacing: 0,
      elevation: 1,
      title:Text(
        text,
          style:  TextStyle(
              color:  Colors.black,
              fontWeight: FontWeight.w400,
              fontStyle:  FontStyle.normal,
              fontSize: SizeConfig.setSp(16)
          ),
          textAlign: TextAlign.center
      ),
      leading: defaultBackButton
          ? IconButton(
        icon: Icon(Icons.keyboard_backspace),
        color: Colors.black,
        onPressed: () => Navigator.pop(context),
      )
          : IconButton(
        onPressed:leftIconCallback,
          icon: Icon(leftIcon),
        color: Colors.black,
      ),
      actions: <Widget>[
        rightIcon == null
            ? Container()
            : IconButton(
          onPressed:rightIconCallback,
          icon: Icon(rightIcon),
          color: Colors.black,
        ),
//        IconButton(
//                icon: Image.asset(rightIcon,fit: BoxFit.contain,),
//                onPressed: rightIconCallback,
//              ),
      ],

    );
    /*Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppDivider(),
      ],
    );*/
  }
}

