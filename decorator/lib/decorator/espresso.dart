import 'package:decorator/decorator/beverage.dart';

class Espresso extends Beverage {

  Espresso(String description) {
    this.description = description;
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  double getPrice() {
   return 3.5;
  }
}