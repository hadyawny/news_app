import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  Function onCategorySelect;

  CategoriesScreen(this.onCategorySelect);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryData.getCategories();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            "Pick Your Category of interest",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
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
