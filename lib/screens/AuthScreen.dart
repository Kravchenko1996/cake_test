import 'package:cake_test_task/viewmodels/PinView.dart';
import 'package:cake_test_task/widgets/KeyboardWidget.dart';
import 'package:cake_test_task/widgets/PinInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  final String title;

  const AuthScreen({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    PinView pinView = Provider.of<PinView>(context, listen: false);
    // reset PIN every time screen is open
    pinView.setTmpFinalPin = '';
    pinView.setToEnter = true;
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
              widget.title,
            ),
          ),
          body: Column(
            children: [
              PinInputWidget(
                title: 'Enter your PIN',
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
