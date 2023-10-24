import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;

  CategoryItem(this.categoryData, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryData.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomRight: index.isOdd
                ? const Radius.circular(25)
                : const Radius.circular(0),
            bottomLeft: index.isOdd
                ? const Radius.circular(0)
                : const Radius.circular(25),
          )),
      child: Column(
        children: [
          Image.asset(
            categoryData.image,
            height: 130,
          ),
          Expanded(
              child: Center(
            child: Text(
              categoryData.title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
        ],
      ),
    );
  }
}
