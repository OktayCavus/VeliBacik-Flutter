

import 'package:flutter/material.dart';

// bundan başka sayfalarda etkilenecekse change 
//notifier'dan türetmemiz lazım
class ThemeNotifier extends ChangeNotifier{
  bool isLightTheme = false ;

  void changeTheme(){
    isLightTheme = ! isLightTheme ;
    notifyListeners();
  }
// run time' da değişeceği için get yaptık
  ThemeData get currentTheme => 
  isLightTheme ? ThemeData.light() : ThemeData.dark();
}

