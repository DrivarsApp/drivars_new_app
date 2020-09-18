import 'package:flutter/material.dart';
import 'package:gogame/ui/shared/size_config.dart';

class PickupFilled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.relativeHeight(19.91),
        width: SizeConfig.relativeWidth(87.10),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            SizeConfig.verticalSpacer(3),
            Row(
              children: [
                SizeConfig.horizontalSpacer(7),
                Icon(Icons.location_on),
                SizeConfig.horizontalSpacer(7),
                Container(
                    height: SizeConfig.relativeHeight(6),
                    width: SizeConfig.relativeWidth(60),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Malleswaram,Bangalore",
                      ),
                    )
                )
              ],
            ),
            SizeConfig.verticalSpacer(2),
            Row(
              children: [
                SizeConfig.horizontalSpacer(7),
                Icon(Icons.location_on),
                SizeConfig.horizontalSpacer(7),
                Container(
                  height: SizeConfig.relativeHeight(6),
                  width: SizeConfig.relativeWidth(60),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "RR Nagar, Bangalore",
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