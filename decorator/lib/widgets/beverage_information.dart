import 'package:decorator/decorator/decorator.dart';
import 'package:decorator/widgets/layout_constant.dart';
import 'package:flutter/material.dart';



class BeverageInformation extends StatelessWidget {
  final Beverage beverage;

  const BeverageInformation({
    required this.beverage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Beverage details:',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: LayoutConstants.spaceL),
        Text(
          beverage.getDescription(),
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16)
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        Text('Price: \$${beverage.getPrice().toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
