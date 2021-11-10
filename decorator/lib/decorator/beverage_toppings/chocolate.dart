import '../beverage.dart';
import '../beverage_decorator.dart';

class Chocolate extends BeverageDecorator {
  Chocolate(Beverage beverage) : super(beverage)  {
    description = 'Chocolate';
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
