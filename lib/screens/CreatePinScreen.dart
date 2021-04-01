import 'package:cake_test_task/viewmodels/PinView.dart';
import 'package:cake_test_task/widgets/KeyboardWidget.dart';
import 'package:cake_test_task/widgets/PinInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePinScreen extends StatelessWidget {
  final String title;
  final String pin;

  const CreatePinScreen({
    Key key,
    this.title,
    this.pin,
  }) : super(key: key);

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
              title,
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
