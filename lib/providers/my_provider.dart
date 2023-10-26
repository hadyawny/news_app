
import 'package:flutter/material.dart';
import 'package:news_app/prefs/prefs_helper.dart';

class MyProvider extends ChangeNotifier{

  String locale = 'en';

  void init()  async{

    String newLanguage = PrefsHelper.getLang();
    changeLanguage(newLanguage ?? "en");

  }

  changeLanguage (String lang){

    locale=lang;
    PrefsHelper.saveLang(lang);
    notifyListeners();
  }


}