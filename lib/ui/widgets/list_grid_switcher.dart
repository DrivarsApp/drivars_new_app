import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListGridSwitcher extends StatelessWidget {
  final bool isListView;
  final Function switchBetween;

  const ListGridSwitcher({Key key, this.isListView, this.switchBetween})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: !isListView ? null : switchBetween,
          child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/grid-view.svg',
                      color:
                          !isListView ? AppTheme.backgroundColor : Colors.black),
                  Text("Grid View",
                      style: TextStyle(
                        fontFamily: AppTheme.ffRegular,
                        color: !isListView ? Colors.white : Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.1445,
                      ))
                ],
              ),
              width: SizeConfig.relativeWidth(30),
              height: SizeConfig.relativeHeight(5),
              decoration: new BoxDecoration(
                  border: Border.all(
                    color: Color(0xfff6f6f6),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x7fe3e3e3),
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        spreadRadius: 0)
                  ],
                  color: !isListView
                      ? AppTheme.plRedColor
                      : AppTheme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      topLeft: Radius.circular(120)))),
        ),
        GestureDetector(
          onTap: isListView ? null : switchBetween,
          child: Container(
            height: SizeConfig.relativeHeight(5),
            width: SizeConfig.relativeWidth(30),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xfff6f6f6),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0x7fe3e3e3),
                    offset: Offset(0, 1),
                    blurRadius: 3,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(120),
                  bottomRight: Radius.circular(120)),
              color:
                  !isListView ? AppTheme.backgroundColor : AppTheme.plRedColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/list-view.svg',
                  color: !isListView ? Colors.black: AppTheme.backgroundColor ,
                ),
                Text("List View",
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: !isListView ? Colors.black : Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.1445,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
