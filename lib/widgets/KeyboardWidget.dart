import 'package:cake_test_task/widgets/BackspaceButton.dart';
import 'package:flutter/material.dart';
import 'package:cake_test_task/widgets/NumericButton.dart';

class KeyboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(50),
        crossAxisCount: 3,
        crossAxisSpacing: 30,
        mainAxisSpacing: 20,
        children: List.generate(
          12,
          (index) => index < 9
              ? NumericButton(
                  number: index + 1,
                )
              : index == 9
                  ? Container()
                  : index == 11
                      ? BackspaceButton()
                      : NumericButton(
                          number: 0,
                        ),
        ),
      ),
    );
  }
}
