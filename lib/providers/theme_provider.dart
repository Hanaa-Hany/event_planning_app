import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  //data
  ThemeMode themeModeApp=ThemeMode.light;
  void changeTheme(ThemeMode mode){
    if(themeModeApp==mode){
      return;
    }
    themeModeApp=mode;
    notifyListeners();
  }
  bool isLightMode(){
    return themeModeApp==ThemeMode.light;
  }
}