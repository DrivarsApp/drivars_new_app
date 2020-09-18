import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:gogame/ui/widgets/AppCustomButton.dart';
import 'package:gogame/ui/widgets/app_divider.dart';

class PaymentModalSheet extends StatelessWidget {
  final String amountText;
  final String balanceAmount;
  final String buttonText;
  final bool showSubtitle;
  final Function buttonPress;

  const PaymentModalSheet(this.amountText, this.balanceAmount, this.buttonText,
      {this.buttonPress, this.showSubtitle = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: SizeConfig.relativeWidth(4.63),
                  ),
                  child: Text(
                    'Pay',
                    style: TextStyle(
                      fontSize: SizeConfig.setSp(22),
                      fontFamily: AppTheme.interBold,
                    ),
                  ),
                ),
                CloseButton(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: SizeConfig.relativeWidth(4.63),
                right: SizeConfig.relativeWidth(4.87),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.lock_outline,
                            size: SizeConfig.relativeWidth(4.41),
                          ),
                          Text(
                            'Entry Fee',
                            style: TextStyle(
                              fontSize: SizeConfig.setSp(22),
                              fontFamily: AppTheme.interBold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '\u{20B9}$amountText',
                        style: TextStyle(
                          fontSize: SizeConfig.setSp(22),
                          fontFamily: AppTheme.interBold,
                        ),
                      ),
                    ],
                  ),
                  SizeConfig.verticalSpacer(2.24),
                  AppDivider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
//                    onTap: () => onPressed,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: Image.asset(
                        'assets/images/rupees.png',
                        width: SizeConfig.relativeWidth(5.12),
                        height: SizeConfig.relativeHeight(2.35),
                      ),
                    ),
                    title: Text(
                      'Balance: \u{20B9}$balanceAmount',
                      style: TextStyle(
                        fontSize: SizeConfig.setSp(15),
                        fontFamily: AppTheme.interBold,
                      ),
                    ),
                    subtitle: showSubtitle
                        ? Text(
                            'Insufficient Balance',
                            style: TextStyle(
                              fontSize: SizeConfig.setSp(10),
                              fontFamily: AppTheme.interRegular,
                              color: Colors.red,
                            ),
                          )
                        : null,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  //SizeConfig.verticalSpacer(2.02),
                  Container(
                    height: SizeConfig.relativeHeight(6.96),
                    child: AppCustomButton(
                      buttonText,
                      onPress: buttonPress,
                    ),
                  ),
                  SizeConfig.verticalSpacer(2.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
