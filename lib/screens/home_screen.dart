import 'package:flutter/material.dart';
import 'package:news_app/models/category_data.dart';
import 'package:news_app/providers/my_provider.dart';
import 'package:news_app/screens/tab_controller.dart';
import 'package:provider/provider.dart';

import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  CategoryData categoryData;
  String search;

  HomeScreen(this.categoryData, this.search, {super.key});

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<MyProvider>(context);

    return FutureBuilder(
      future: ApiManager.getSources(categoryData.id,provider.locale),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something Went Wrong"));
        }
        if (snapshot.data?.status != "ok") {
          return Center(child: Text(snapshot.data!.message!));
        }
        var sources = snapshot.data?.sources ?? [];

        return TabControllerScreen(sources, search);
      },
    );
  }
}
