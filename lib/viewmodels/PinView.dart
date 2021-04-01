import 'package:flutter/material.dart';

class PinView with ChangeNotifier {
  String _pin = '';

  String get pin => _pin;

  void extendPin(int number) {
    if (_pin.length < 4) {
      _pin += number.toString();
      print('first pin => ${_pin.length}');
    }
    notifyListeners();
  }

  String _secondPin = '';

  String get secondPin => _pin;

  void extendSecondPin(int number) {
    if (_secondPin.length < 4) {
      _secondPin += number.toString();
      print('second pin => ${_secondPin.length}');
    }
    notifyListeners();
  }
}
