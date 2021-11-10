import 'package:decorator/decorator/espresso.dart';

import 'beverage.dart';
import 'beverage_toppings/beverage_toppings.dart';
import 'coffee.dart';
import 'beverage_topping_data.dart';

class BeverageMenu {
  final Map<int, BeverageToppingData> _beverageToppingsDataMap = {
    1: BeverageToppingData('Chocolate'),
    2: BeverageToppingData('Cream'),
    3: BeverageToppingData('Foam'),
    4: BeverageToppingData('Steamed Milk'),
    5: BeverageToppingData('Sugar'),
  };

  Map<int, BeverageToppingData> getBeverageToppingsDataMap() => _beverageToppingsDataMap;

  Beverage getBeverage(int index, Map<int, BeverageToppingData> beverageToppingsDataMap) {
    switch (index) {
      case 0:
        return _getCappuccino();
      case 1:
        return _getMacchiato();
      case 2:
        return _getCustom(beverageToppingsDataMap);
    }

    throw Exception("Index of '$index' does not exist.");
  }

  Beverage _getCappuccino() {
    Beverage beverage = Espresso('- Espresso');
    beverage = SteamedMilk(beverage);
    beverage = SteamedMilk(beverage);
    beverage = Foam(beverage);

    return beverage;
  }

  Beverage _getMacchiato() {
    Beverage beverage = Coffee('- Coffee');
    beverage = Sugar(beverage);
    beverage = SteamedMilk(beverage);
    beverage = Cream(beverage);

    return beverage;
  }

  Beverage _getCustom(Map<int, BeverageToppingData> pizzaToppingsDataMap) {
    Beverage beverage = Coffee('- Coffee');

    if (pizzaToppingsDataMap[1]!.selected) {
      beverage = Chocolate(beverage);
    }

    if (pizzaToppingsDataMap[2]!.selected) {
      beverage = Cream(beverage);
    }

    if (pizzaToppingsDataMap[3]!.selected) {
      beverage = Foam(beverage);
    }

    if (pizzaToppingsDataMap[4]!.selected) {
      beverage = SteamedMilk(beverage);
    }

    if (pizzaToppingsDataMap[5]!.selected) {
      beverage = Sugar(beverage);
    }

    return beverage;
  }
}
