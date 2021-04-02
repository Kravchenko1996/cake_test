import 'package:cake_test_task/viewmodels/PinView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackspaceButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext pinContext,
        PinView pinView,
        Widget child,
      ) {
        return IconButton(
          icon: Icon(Icons.backspace_outlined),
          onPressed: () {
            if (pinView.toEnter) {
              pinView.deleteLastSymbol(pinView.tmpFinalPin);
            } else {
              if (pinView.pin.length != 4) {
                pinView.deleteLastSymbol(pinView.pin);
              } else if (pinView.secondPin.length != 4) {
                pinView.deleteLastSymbol(pinView.secondPin);
              }
            }
          },
        );
      },
    );
  }
}
