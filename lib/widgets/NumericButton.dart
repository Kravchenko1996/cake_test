import 'package:cake_test_task/screens/AuthScreen.dart';
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
            pinView.pin.length != 4
                ? pinView.extendPin(number)
                : pinView.secondPin.length == 4
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildDialog(context);
                        },
                      )
                    : pinView.extendSecondPin(number);
          },
          child: Text(
            number.toString(),
            style: TextStyle(color: Colors.black),
          ),
        );
      },
    );
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      content: Text('Your PIN has been set up successfully!'),
      actions: [
        FlatButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
            ),
          ),
          child: Center(
            child: Text('OK'),
          ),
        ),
      ],
    );
  }
}
