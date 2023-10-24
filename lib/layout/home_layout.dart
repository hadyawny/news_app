import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/styles/colors.dart';

import '../screens/categories_screen.dart';
import '../screens/drawer_screen.dart';
import '../screens/tab_controller.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: primary,
          title: Text("News App"),
          centerTitle: true,
          elevation: 0.0,
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        body: categoryData==null? CategoriesScreen(onCategorySelected):HomeScreen(categoryData!),
        drawer: DrawerScreen(),

      ),
    );
  }

  CategoryData? categoryData=null;

  void onCategorySelected(categorySelected){
    categoryData=categorySelected;
    setState(() {

    });
  }
}
