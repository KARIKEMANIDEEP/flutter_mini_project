import 'package:flutter/material.dart';

import '../../core/local_storage.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isChecking = true;
  String username = '';
  AuthProvider() {
    checkLogin();
  }
  Future<void> checkLogin() async {
    isLoggedIn = await LocalStorage.isLoggedIn();
    if (isLoggedIn) {
      username = await LocalStorage.getUsername();
    }
    isChecking = false;
    notifyListeners();
  }

  Future<void> login(String name) async {
    isLoggedIn = true;
    username = name;
    await LocalStorage.saveLogin(name);
    notifyListeners();
  }

  Future<void> logout() async {
    await LocalStorage.logout();
    isLoggedIn = false;
    username = '';
    notifyListeners();
  }
}
