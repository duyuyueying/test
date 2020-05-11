import 'package:flutter/material.dart';

// 用户token信息管理
class UserInfo with ChangeNotifier{
  String _token;
  get token => _token;

  void changeToken(String token) {
    _token = token;
    notifyListeners();
  }
}