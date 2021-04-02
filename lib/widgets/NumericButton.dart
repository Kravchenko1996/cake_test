import 'package:cake_test_task/viewmodels/PinView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumericButton extends StatelessWidget {
  final int number;

  const NumericButton({
    Key key,
    this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext pinContext,
        PinView pinView,
        Widget child,
      ) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          onPressed: () {
            if (pinView.toEnter) {
              pinView.extendFinalPin(
                number,
                context,
              );
            } else {
              if (pinView.pin.length != 4) {
                pinView.extendPin(
                  number,
                );
              } else if (pinView.secondPin.length != 4) {
                pinView.extendSecondPin(
                  number,
                  context,
                );
              }
            }
          },
          child: Text(
            number.toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
