import 'package:flutter/material.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/shared/styles/colors.dart';

class DrawerScreen extends StatelessWidget {
  Function onDrawerSelected;

  static const int CATEGORIES = 1;
  static const int SETTINGS = 2;

  DrawerScreen(this.onDrawerSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: primary,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                "News App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () {
                onDrawerSelected(CATEGORIES);
              },
              child:  Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
             InkWell(
               onTap: (){
                 Navigator.pop(context);

                 Navigator.pushNamed(context, SettingsScreen.routeName);
               },
               child: Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Settings",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
            ),
             ),
          ],
        ),
      ),
    );
  }
}
