import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {

  ThemeChanger(int theme) {

    switch (theme) {

      case 1: //light
         _customTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: //light
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: //light
        _darkTheme = false;
        _customTheme = true;
        break;

    }

  }
  
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  ThemeData get currentTheme => _currentTheme;


  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    _currentTheme = (value) ? ThemeData.dark() : ThemeData.light();

    notifyListeners();
  }

  bool get customTheme => _customTheme;

  set customTheme(bool value) {
     _darkTheme = false;
    _customTheme = value;

    _currentTheme = (!value) ? ThemeData.dark() : ThemeData.light();

    notifyListeners();
  }




}