import '../beverage.dart';
import '../beverage_decorator.dart';

class Foam extends BeverageDecorator {
  Foam(Beverage beverage) : super(beverage) {
    description = 'Foam';
  }

  @override
  String getDescription() {
    return '${beverage.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return beverage.getPrice() + 1;
  }
}
