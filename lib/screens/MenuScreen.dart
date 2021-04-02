import 'package:cake_test_task/screens/AuthScreen.dart';
import 'package:cake_test_task/screens/CreatePinScreen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final String createPin = 'Create PIN';
  final String auth = 'Authenticate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  createPin,
                  CreatePinScreen(
                    title: createPin,
                  ),
                  context,
                ),
                _buildButton(
                  auth,
                  AuthScreen(
                    title: auth,
                  ),
                  context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    String title,
    Widget route,
    BuildContext context,
  ) {
    return MaterialButton(
      minWidth: 300,
      color: Colors.lightBlue,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
