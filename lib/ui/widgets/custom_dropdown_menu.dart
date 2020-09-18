import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/ui/shared/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu<T extends Object> extends StatefulWidget {
  final DropdownMenuItem Function(T) buildSingleItem;
  final List<T> items;
  final Function(T value) onItemSelected;
  final Widget icon;

  const CustomDropDownMenu(
      {Key key,
      this.buildSingleItem,
      this.items,
      this.onItemSelected,
      this.icon})
      : super(key: key);

  @override
  _CustomDropDownMenuState<T> createState() => _CustomDropDownMenuState<T>();
}

class _CustomDropDownMenuState<T extends Object>
    extends State<CustomDropDownMenu<T>> {
  List<DropdownMenuItem<T>> _items;
  T _selectedItem;

  @override
  void initState() {
    _items =
        widget.items.map<DropdownMenuItem<T>>(widget.buildSingleItem).toList();
    _selectedItem = widget.items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppTheme.textFieldUnderLineColor,
                  width: 1,
                  style: BorderStyle.solid))),
      height: SizeConfig.relativeHeight(7.5),
      child: DropdownButton(
        hint: Text('Hint'),
        underline: Container(),
        style: TextStyle(
          color: Color(0xff30333c),
          fontSize: SizeConfig.setSp(16),
          fontFamily: AppTheme.ffRegular,
        ),
        icon: Image.asset(
          'assets/images/caret@3x.png',
          width: SizeConfig.relativeSize(7),
          height: SizeConfig.relativeSize(7),
        ),
        items: _items,
        onChanged: (T value) {
          setState(() {
            _selectedItem = value;
          });

          widget.onItemSelected(value);
        },
        isExpanded: true,
        value: _selectedItem,
      ),
    );
  }
}
