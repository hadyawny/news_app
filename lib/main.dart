import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/prefs/prefs_helper.dart';
import 'package:news_app/providers/my_provider.dart';
import 'package:news_app/screens/news_article_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs = await SharedPreferences.getInstance();

  runApp( ChangeNotifierProvider(
      create: (context) => MyProvider()..init(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      
      locale: Locale(provider.locale),

      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        NewsArticleScreen.routeName: (context) =>  NewsArticleScreen(),
        SettingsScreen.routeName: (context) =>  SettingsScreen(),
      },
    );
  }
}
