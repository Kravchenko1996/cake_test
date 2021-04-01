import 'package:flutter/material.dart';
import 'package:cake_test_task/widgets/NumericButton.dart';

class KeyboardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.all(50),
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
        children: List.generate(
          10,
          (index) => index != 9
              ? NumericButton(
                  number: index + 1,
                )
              : NumericButton(
                  number: 0,
                ),
        ),
      ),
    );
  }
}
