import 'package:flutter/material.dart';
import '../shared/styles/colors.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "SettingsScreen";

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text("Settings"),
          centerTitle: true,
          elevation: 0.0,
          shape: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
