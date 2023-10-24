import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelect;

  CategoriesScreen(this.onCategorySelect, {super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Pick Your Category of interest",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategorySelect(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
              },
            ),
          )
        ],
      ),
    );
  }
}
