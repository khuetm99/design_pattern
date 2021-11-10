import 'package:decorator/decorator/decorator.dart';
import 'package:decorator/widgets/layout_constant.dart';
import 'package:flutter/material.dart';



class CustomBeverageSelection extends StatelessWidget {
  final Map<int, BeverageToppingData> beverageToppingsDataMap;
  final Function(int, bool?) onSelected;

  const CustomBeverageSelection({
    required this.beverageToppingsDataMap,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: LayoutConstants.spaceM,
      children: <Widget>[
        for (var i = 0; i < beverageToppingsDataMap.length; i++)
          i == 0
              ? ChoiceChip(
                  label: const Text(
                    'Coffee',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: true,
                  selectedColor: Colors.black,
                  onSelected: (_) {},
                )
              : ChoiceChip(
                  label: Text(
                    beverageToppingsDataMap[i]!.label,
                    style: TextStyle(
                      color: beverageToppingsDataMap[i]!.selected
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  selected: beverageToppingsDataMap[i]!.selected,
                  selectedColor: Colors.black,
                  onSelected: (bool? selected) => onSelected(i, selected),
                ),
      ],
    );
  }
}
