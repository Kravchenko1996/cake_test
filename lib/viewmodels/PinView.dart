import 'package:flutter/material.dart';

class PinView with ChangeNotifier {
  String _pin = '';

  String get pin => _pin;

  String _secondPin = '';

  String get secondPin => _secondPin;

  void extendPin(int number) {
    if (_pin.length < 4) {
      _pin += number.toString();
      print('first pin => ${_pin}');
      notifyListeners();
    }
  }

  void extendSecondPin(int number) {
    if (_secondPin.length < 4) {
      _secondPin += number.toString();
      print('second pin => ${_secondPin}');
      notifyListeners();
    }
  }
}
