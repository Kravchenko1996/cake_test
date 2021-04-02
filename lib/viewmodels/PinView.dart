import 'package:flutter/material.dart';

class PinView with ChangeNotifier {
  // if it is needed to change PIN length
  int _pinLength = 4;

  int get pinLength => _pinLength;

  String _pin = '';

  String get pin => _pin;

  set setPin(String value) => _pin = value;

  String _secondPin = '';

  String get secondPin => _secondPin;

  set setSecondPin(String value) => _secondPin = value;

  String _finalPin = '';

  String get finalPin => _finalPin;

  String _tmpFinalPin = '';

  String get tmpFinalPin => _tmpFinalPin;

  set setTmpFinalPin(String value) => _tmpFinalPin = value;

  bool _toEnter = false;

  bool get toEnter => _toEnter;

  set setToEnter(bool value) => _toEnter = value;

  void extendPin(
    int number,
  ) {
    if (_pin.length < 4) {
      _pin += number.toString();
      notifyListeners();
    }
  }

  void extendSecondPin(
    int number,
    BuildContext context,
  ) {
    if (_secondPin.length != 4) {
      _secondPin += number.toString();
      if (_pin == _secondPin) {
        _finalPin = _secondPin;
        _buildDialog(
          context,
          'Your PIN has been set up successfully!',
        );
      } else if (_secondPin.length == 4 && _pin != _secondPin) {
        _buildDialog(
          context,
          'PIN must be equal to the first one!',
        );
      }
    }
    notifyListeners();
  }

  void extendFinalPin(
    int number,
    BuildContext context,
  ) {
    if (_tmpFinalPin.length < 4) {
      _tmpFinalPin += number.toString();
      if (_tmpFinalPin == _finalPin) {
        _buildDialog(
          context,
          'Authentication success!',
        );
        _tmpFinalPin = '';
      } else if (_tmpFinalPin.length == 4 && _tmpFinalPin != _finalPin) {
        _buildDialog(
          context,
          'Authentication failed!',
        );
        _tmpFinalPin = '';
      }
      notifyListeners();
    }
  }

  void deleteLastSymbol(
    String pin,
  ) {
    if (pin.length != 0) {
      List<String> tmp = pin.split("");
      tmp.removeLast();
      if (pin == _pin) {
        _pin = tmp.join();
      } else if (pin == _secondPin) {
        _secondPin = tmp.join();
      } else {
        _tmpFinalPin = tmp.join();
      }
      notifyListeners();
    }
  }

  Future _buildDialog(
    BuildContext context,
    String text,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: [
            FlatButton(
              onPressed: () {
                _pin = '';
                _secondPin = '';
                notifyListeners();
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }
}
