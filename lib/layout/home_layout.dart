import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/shared/styles/colors.dart';
import '../screens/categories_screen.dart';
import '../screens/drawer_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool onSearchClicked = false;
  CategoryData? categoryData;

  String search = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            categoryData == null
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      setState(() {
                        onSearchClicked
                            ? onSearchClicked = false
                            : onSearchClicked = true;
                        if (onSearchClicked == false) {
                          search = '';
                        }
                      });
                    },
                    icon: Icon(
                      onSearchClicked ? Icons.close : Icons.search,
                      color: Colors.white,
                      size: 30,
                    )),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: primary,
          title: onSearchClicked
              ? TextField(
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    fillColor: Colors.white,
                    hintText: "Search Article",
                  ))
              : const Text("News App"),
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
        body: categoryData == null
            ? CategoriesScreen(onCategorySelected)
            : HomeScreen(categoryData!, search),
        drawer: onSearchClicked ? null : DrawerScreen(onDrawerSelected),
      ),
    );
  }

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }

  void onDrawerSelected(number) {
    if (number == DrawerScreen.CATEGORIES) {
      categoryData = null;
    }
    if (number == DrawerScreen.SETTINGS) {
      return;
    }
    setState(() {
      Navigator.pop(context);
    });
  }
}
