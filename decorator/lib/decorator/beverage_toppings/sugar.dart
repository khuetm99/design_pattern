import '../beverage.dart';
import '../beverage_decorator.dart';

class Sugar extends BeverageDecorator {
  Sugar(Beverage beverage) : super(beverage) {
    description = 'Sugar';
  }

  @override
  String getDescription() {
    return '${beverage.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return beverage.getPrice() + 0.1;
  }
}
