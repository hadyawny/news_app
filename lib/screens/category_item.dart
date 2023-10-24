import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;

  CategoryItem(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryData.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight:
                index.isOdd ? Radius.circular(25) : Radius.circular(0),
            bottomLeft: index.isOdd ? Radius.circular(0) : Radius.circular(25),
          )),
      child: Column(
        children: [
          Image.asset(categoryData.image,height: 130,),
          Expanded(child: Container(child: Center(child: Text(categoryData.title,style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold , color: Colors.white
          ),),),)),
        ],
      ),
    );
  }
}
