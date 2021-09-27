import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuadroContador with ChangeNotifier {
  // Numero Contador
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void restart() {
    _count = 0;
    notifyListeners();
  }

  // Color del Cuadro
  Color? _bcolor = Colors.grey[300];
  get bcolor => _bcolor;

  void black() {
    _bcolor = Colors.black87;
    notifyListeners();
  }

  void red() {
    _bcolor = Colors.red;
    notifyListeners();
  }

  void blue() {
    _bcolor = Colors.blue;
    notifyListeners();
  }

  void green() {
    _bcolor = Colors.green;
    notifyListeners();
  }
}
