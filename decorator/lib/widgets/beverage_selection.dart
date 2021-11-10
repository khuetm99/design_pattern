import 'package:flutter/material.dart';

const _labels = ['Cappuccino', 'Macchiato', 'Custom Coffee'];

class BeverageSelection extends StatelessWidget {
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const BeverageSelection({
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < _labels.length; i++)
          RadioListTile(
            title: Text(_labels[i]),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
