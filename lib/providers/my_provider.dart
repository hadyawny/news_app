
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  String locale = 'en';

  changeLanguage (String lang){

    locale=lang;

    notifyListeners();
  }


}