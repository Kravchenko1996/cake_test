import 'package:cake_test_task/viewmodels/PinView.dart';
import 'package:cake_test_task/widgets/KeyboardWidget.dart';
import 'package:cake_test_task/widgets/PinInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePinScreen extends StatefulWidget {
  final String title;
  final String pin;

  const CreatePinScreen({
    Key key,
    this.title,
    this.pin,
  }) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  void initState() {
    super.initState();
    PinView pinView = Provider.of<PinView>(context, listen: false);
    // reset PIN every time screen is open
    pinView.setPin = '';
    pinView.setSecondPin = '';
    pinView.setToEnter = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext pinContext,
        PinView pinView,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Setup PIN',
            ),
          ),
          body: Column(
            children: [
              pinView.pin.length != 4
                  ? PinInputWidget(
                      title: 'Create PIN',
                    )
                  : PinInputWidget(
                      title: 'Re-enter your PIN',
                    ),
              Container(
                child: KeyboardWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
