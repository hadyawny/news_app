import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences prefs;


  static saveLang(String lang) async {
    await prefs.setString("lang", lang);
  }

  static String getLang() {
    return prefs.getString("lang") ?? "light";
  }
}
