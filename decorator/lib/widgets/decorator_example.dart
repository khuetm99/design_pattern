import 'package:decorator/decorator/decorator.dart';
import 'package:decorator/widgets/layout_constant.dart';
import 'package:flutter/material.dart';


import 'custom_beverage_selection.dart';
import 'beverage_information.dart';
import 'beverage_selection.dart';

class DecoratorExample extends StatefulWidget {
  const DecoratorExample();

  @override
  _DecoratorExampleState createState() => _DecoratorExampleState();
}

class _DecoratorExampleState extends State<DecoratorExample> {
  final BeverageMenu beverageMenu = BeverageMenu();

  late final Map<int, BeverageToppingData> _beverageToppingsDataMap;
  late Beverage _beverage;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _beverageToppingsDataMap = beverageMenu.getBeverageToppingsDataMap();
    _beverage = beverageMenu.getBeverage(0, _beverageToppingsDataMap);
  }

  void _onSelectedIndexChanged(int? index) {
    _setSelectedIndex(index!);
    _setSelectedBeverage(index);
  }

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCustomBeverageChipSelected(int index, bool? selected) {
    _setChipSelected(index, selected!);
    _setSelectedBeverage(_selectedIndex);
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _beverageToppingsDataMap[index]!.setSelected(isSelected: selected);
    });
  }

  void _setSelectedBeverage(int index) {
    setState(() {
      _beverage = beverageMenu.getBeverage(index, _beverageToppingsDataMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Decorator demo", style: TextStyle(color: Colors.black),),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Select your beverage:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                BeverageSelection(
                  selectedIndex: _selectedIndex,
                  onChanged: _onSelectedIndexChanged,
                ),
                if (_selectedIndex == 2)
                  CustomBeverageSelection(
                    beverageToppingsDataMap: _beverageToppingsDataMap,
                    onSelected: _onCustomBeverageChipSelected,
                  ),
                BeverageInformation(
                  beverage: _beverage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
