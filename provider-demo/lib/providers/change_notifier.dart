import 'package:flutter/cupertino.dart';

class ChangeNotifierClass extends ChangeNotifier {
  int _contador = 0;
  int get contador => _contador;

  void incrementarContador() {
    _contador++;
    notifyListeners();
  }

  void decrementarContador() {
    _contador--;
    notifyListeners();
  }
}
