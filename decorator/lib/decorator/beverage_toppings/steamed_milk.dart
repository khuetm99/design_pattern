import '../beverage.dart';
import '../beverage_decorator.dart';

class SteamedMilk extends BeverageDecorator {
  SteamedMilk(Beverage beverage) : super(beverage) {
    description = 'Steamed Milk';
  }

  @override
  String getDescription() {
    return '${beverage.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return beverage.getPrice() + 0.7;
  }
}
