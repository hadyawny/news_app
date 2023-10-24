import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/screens/tab_controller.dart';

import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {

  CategoryData categoryData;


  HomeScreen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something Went Wrong"));
        }
        if (snapshot.data?.status != "ok") {
          return Center(child: Text(snapshot.data!.message!));
        }
        var sources = snapshot.data?.sources ?? [];

        return TabControllerScreen(sources);
      },
    );
  }
}