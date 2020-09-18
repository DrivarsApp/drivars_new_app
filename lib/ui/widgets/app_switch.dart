import 'package:gogame/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppSwitch extends StatelessWidget {
  final bool isEnabled;
  final Function(bool) onChange;
  AppSwitch({this.isEnabled, this.onChange});
  //TODO remove the extra padding at the end of the Switch
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Switch(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onChanged: (bool isEnabled) => onChange(isEnabled),
        value: isEnabled,
        activeTrackColor: AppTheme.switchActiveTrackColor,
        inactiveTrackColor: AppTheme.switchInactiveTrackColor,
        inactiveThumbColor: AppTheme.plRedColor,
        activeThumbImage: AssetImage(AppTheme.iconCheck),
        activeColor: Colors.white,
        hoverColor: Colors.transparent,
      ),
    );
  }
}
