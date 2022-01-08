import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginModel extends ChangeNotifier {
  bool _isLogin = false;
  String _name = "";

  bool get isLogin => _isLogin;

  String get name => _name;

  void setLogin(String name) {
    _isLogin = true;
    _name = name;
    notifyListeners();
  }

  void logoOut() {
    _isLogin = false;
    notifyListeners();
  }
}
