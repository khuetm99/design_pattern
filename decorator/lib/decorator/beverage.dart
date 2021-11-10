import 'package:meta/meta.dart';

abstract class Beverage {
  @protected
  late String description;

  String getDescription();
  double getPrice();
}
