import 'package:flutter/material.dart';
import 'package:gogame/constants/images.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:hexcolor/hexcolor.dart';

class Pickup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.relativeHeight(19.91),
        width: SizeConfig.relativeWidth(87.10),
        decoration: BoxDecoration(
            color: Hexcolor('#3E4E87'),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            SizeConfig.verticalSpacer(2),
            Row(
              children: [
                SizeConfig.horizontalSpacer(7),
                Image(
                  image: AssetImage(ImagesPaths.icongoal),
                  width: SizeConfig.relativeWidth(6.99),
                  height: SizeConfig.relativeHeight(8.40),
                ),
                SizeConfig.horizontalSpacer(7),
                Container(
                    height: SizeConfig.relativeHeight(6),
                    width: SizeConfig.relativeWidth(60),
                    child: TextField(
                      decoration: InputDecoration(
//                        border: OutlineInputBorder(
//                          borderSide: BorderSide(
//                            color: Colors.blue,
//                          ),
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
                        hintText: "Malleswarm,Bangalore",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    )
                )
              ],
            ),

            Row(
              children: [
                SizeConfig.horizontalSpacer(7),
                Image(
                  image: AssetImage(ImagesPaths.iconplaceholder),
                  width: SizeConfig.relativeWidth(6.99),
                  height: SizeConfig.relativeHeight(8.40),
                ),
                SizeConfig.horizontalSpacer(7),
                Container(
                  height: SizeConfig.relativeHeight(6),
                  width: SizeConfig.relativeWidth(60),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
//                      border: OutlineInputBorder(
//                        borderSide: BorderSide(
//                          color: Colors.blue,
//                        ),
//                        borderRadius: BorderRadius.circular(10.0),
//                      ),
                      hintText: "RR Nagar,Bangalore",
                      hintStyle: TextStyle(color: Colors.white),

                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
  }
}