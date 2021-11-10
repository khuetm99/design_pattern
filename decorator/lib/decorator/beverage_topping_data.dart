class BeverageToppingData {
  final String label;
  bool selected = false;

  BeverageToppingData(this.label);

  // ignore: use_setters_to_change_properties
  void setSelected({required bool isSelected}) {
    selected = isSelected;
  }
}
