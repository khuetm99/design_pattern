import 'beverage.dart';

class Coffee extends Beverage {
  Coffee(String description) {
    this.description = description;
  }

  @override
  String getDescription() {
    return description;
  }

  @override
  double getPrice() {
    return 3.0;
  }
}
