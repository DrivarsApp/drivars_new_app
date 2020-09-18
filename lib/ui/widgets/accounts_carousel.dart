import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AccountsCarousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountsCarouselState();
  }
}

class _AccountsCarouselState extends State<AccountsCarousel> {
  int _current = 0;
  final _carouselList = [
    CarouselItem(
      balance: 23164.65,
      accountNumber: '254 ***** 5555',
      currency: 'KES',
      month: 11,
      onholdAmount: 1500.50,
      pendingAmount: 5496.46,
      year: 24,
    ),
    CarouselItem(
      balance: 56454.65,
      accountNumber: '254 ***** 6487',
      currency: 'KES',
      month: 05,
      year: 22,
      customIconPath: 'assets/images/m_coop_cash.png',
      customIconScaleFactor: 1.5,
      mainBalanceColor: Color(0xff005441),
      showMainBalanceOnly: true, onholdAmount: null, pendingAmount: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: SizeConfig.relativeWidth(62),
      color: Color(0xfff9f9fc),
      child: Column(children: [
        CarouselSlider(
          items: _carouselList,
          options: CarouselOptions(
              height: SizeConfig.relativeHeight(32),
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _carouselList.map((item) {
              int index = _carouselList.indexOf(item);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _current == index ? Color(0xffd0021b) : Color(0xffd1d1d1),
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String currency;
  final String accountNumber;
  final double balance;
  final double pendingAmount;
  final double onholdAmount;
  final int month;
  final int year;

  final String customIconPath;
  final double customIconScaleFactor;
  final bool showMainBalanceOnly;
  final Color mainBalanceColor;

  const CarouselItem({
    Key key,
    @required this.currency,
    @required this.balance,
    @required this.accountNumber,
    @required this.pendingAmount,
    @required this.onholdAmount,
    @required this.month,
    @required this.year,
    this.customIconPath,
    this.customIconScaleFactor = 1.0,
    this.showMainBalanceOnly = false,
    this.mainBalanceColor,
  })  : assert(currency != null),
        assert(accountNumber != null),
        assert(month != null),
        assert(year != null),
        assert(balance != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.relativeWidth(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("$currency ${AppTheme.nubmerFormat.format(balance)}",
                      style: TextStyle(
                        fontFamily: AppTheme.ffBold,
                        color: mainBalanceColor != null
                            ? mainBalanceColor
                            : AppTheme.plRedColor,
                        fontSize: SizeConfig.setSp(22),
                      )),
                  Text(accountNumber,
                      style: TextStyle(
                        fontFamily: AppTheme.ffRegular,
                        color: Color(0xff000000),
                        fontSize: SizeConfig.setSp(13),
                        letterSpacing: 0.9285715,
                      ))
                ],
              ),
              SizeConfig.verticalSpacer(3),
              if (!showMainBalanceOnly)
                Text(
                    "Pending: $currency ${AppTheme.nubmerFormat.format(pendingAmount)}",
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: Color(0xff000000),
                      fontSize: SizeConfig.setSp(14),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.9285715,
                    )),
              SizeConfig.verticalSpacer(1),
              if (!showMainBalanceOnly)
                Text(
                    "On Hold: $currency ${AppTheme.nubmerFormat.format(onholdAmount)}",
                    style: TextStyle(
                      fontFamily: AppTheme.ffRegular,
                      color: Color(0xff000000),
                      fontSize: SizeConfig.setSp(14),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.9285715,
                    )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("$month/$year",
                          style: TextStyle(
                            fontFamily: AppTheme.ffRegular,
                            color: Color(0xff333333),
                            fontSize: SizeConfig.setSp(14),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.9191917,
                          )),
                      Container(
                        width: SizeConfig.relativeWidth(22.13) *
                            customIconScaleFactor,
                        height: SizeConfig.relativeHeight(5) *
                            customIconScaleFactor,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            customIconPath != null
                                ? customIconPath
                                : AppTheme.iconAvunja,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
        height: SizeConfig.relativeWidth(50),
        width: SizeConfig.relativeWidth(85.6),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Color(0x7fe3e3e3),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0),
          ],
        ),
      ),
    );
  }
}
