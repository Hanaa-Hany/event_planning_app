import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{
  //data
  String appLanguage="en";
  //fun
  void changeLanguage(String language){
    if(language==appLanguage){
      return;
    }
    appLanguage=language;
    notifyListeners();
  }

}