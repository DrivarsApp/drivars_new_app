


import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String title;
  final Function onPress;
  final bool isDisabled;
  final double borderRadius;
  final String color;


  const Button({
    this.title,
    this.onPress,
    this.isDisabled,
    this.borderRadius = 10.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
