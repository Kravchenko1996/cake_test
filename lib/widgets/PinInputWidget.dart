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
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
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
        );
      },
    );
  }

  Widget _buildDotRow(
    PinView pinView,
  ) {
    return pinView.pin.length != 4
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDotWidget(
                pinView,
                pinView.pin.length > 0 ? true : false,
              ),
              _buildDotWidget(
                pinView,
                pinView.pin.length > 1 ? true : false,
              ),
              _buildDotWidget(
                pinView,
                pinView.pin.length > 2 ? true : false,
              ),
              _buildDotWidget(
                pinView,
                pinView.pin.length > 3 ? true : false,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDotWidget(
                pinView,
                pinView.secondPin.length > 0 ? true : false,
              ),
              _buildDotWidget(
                pinView,
                pinView.secondPin.length > 1 ? true : false,
              ),
              _buildDotWidget(
                pinView,
                pinView.secondPin.length > 2 ? true : false,
              ),
              _buildDotWidget(
                pinView,
                pinView.secondPin.length > 3 ? true : false,
              ),
            ],
          );
  }

  Widget _buildDotWidget(
    PinView pinView,
    bool active,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active ? Colors.red : Colors.white,
      ),
      child: Container(),
    );
  }
}
