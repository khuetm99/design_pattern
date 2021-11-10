import '../beverage.dart';
import '../beverage_decorator.dart';

class Cream extends BeverageDecorator {
  Cream(Beverage beverage) : super(beverage) {
    description = 'Cream';
  }

  @override
  String getDescription() {
    return '${beverage.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return beverage.getPrice() + 0.5;
  }
}
