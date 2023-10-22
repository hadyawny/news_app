import 'package:flutter/material.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import '../screens/tab_controller.dart';

class HomeLayout extends StatelessWidget {

  static const String routeName = "homeLayout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: FutureBuilder(future: ApiManager.getSources(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Center(child: Text("Something Went Wrong"));
        }
        if(snapshot.data?.status != "ok"){
          return Center(child: Text(snapshot.data!.message!));
        }
        var sources = snapshot.data?.sources??[];

        return TabControllerScreen(sources);


      },),
    );
  }
}
