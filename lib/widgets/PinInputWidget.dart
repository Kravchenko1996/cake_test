import 'package:flutter/material.dart';
import 'package:cake_test_task/viewmodels/PinView.dart';
import 'package:provider/provider.dart';

class PinInputWidget extends StatelessWidget {
  final String title;

  const PinInputWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext pinContext,
        PinView pinView,
        Widget child,
      ) {
        return Container(
          height: 70,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              _buildDotRow(pinView)
            ],
          ),
        );
      },
    );
  }

  Widget _buildDotRow(
    PinView pinView,
  ) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 90),
        crossAxisCount: pinView.pinLength,
        crossAxisSpacing: 20,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
          pinView.pinLength,
          (index) => _buildDotWidget(
            pinView,
            pinView.toEnter && pinView.tmpFinalPin.length != pinView.pinLength
                ? pinView.tmpFinalPin.length > index
                    ? true
                    : false
                : pinView.pin.length != pinView.pinLength
                    ? pinView.pin.length > index
                        ? true
                        : false
                    : pinView.secondPin.length != pinView.pinLength
                        ? pinView.secondPin.length > index
                            ? true
                            : false
                        : false,
          ),
        ),
      ),
    );
  }

  Widget _buildDotWidget(
    PinView pinView,
    bool active,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.lightBlue : Colors.white,
        border: Border.all(
          color: Colors.blue,
        ),
      ),
    );
  }
}
