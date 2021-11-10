import 'beverage.dart';

abstract class BeverageDecorator extends Beverage {
  final Beverage beverage;

  BeverageDecorator(this.beverage);

  @override
  String getDescription() {
    return beverage.getDescription();
  }

  @override
  double getPrice() {
    return beverage.getPrice();
  }
}
