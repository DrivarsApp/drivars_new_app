import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //  padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          //Divider(),
          createDrawerBodyItem(
              icon: Icons.home,
              text: 'Book Ride',
              onTap: () {
                //model.redirectToPage(BookRideViewRoute);
              }),
          createDrawerBodyItem(icon: Icons.directions_car, text: 'My Drivers'),
          createDrawerBodyItem(
              icon: Icons.credit_card, text: 'Payments', onTap: () {}),
          //Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active, text: 'Refer & Earn'),
          Divider(),
          createDrawerBodyItem(icon: Icons.help, text: 'Help'),
          createDrawerBodyItem(icon: Icons.contact_phone, text: 'Policies'),
          createDrawerBodyItem(
              icon: Icons.supervised_user_circle, text: 'About us'),
          createDrawerBodyItem(icon: Icons.exit_to_app, text: 'Logout'),
          SizeConfig.verticalSpacer(20),
          ListTile(
            title: Align(
              alignment: Alignment.bottomRight,
              child: Text('V 1.0.0'),
            ),
          ),
        ],
      ),
    );
  }

  Widget createDrawerBodyItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          SizeConfig.horizontalSpacer(4.5),
          Text(
            text,
            style: TextStyle(
              color: AppColors.greyDarkColor,
              fontFamily: AppTheme.interRegular,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.setSp(18.0),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget createDrawerHeader() {
    return Container(
      height: SizeConfig.relativeHeight(15.45),
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 35,
                ),
              ),
              SizeConfig.verticalSpacer(4),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "jyoti sharma",
                    style: TextStyle(
                      color: AppColors.greyDarkColor,
                      fontFamily: AppTheme.interRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(18.0),
                    ),
                  ),
                  Text(
                    "+91 7805977569",
                    style: TextStyle(
                      color: AppColors.greyDarkColor,
                      fontFamily: AppTheme.interRegular,
                      fontStyle: FontStyle.normal,
                      fontSize: SizeConfig.setSp(18.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
