import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_model.dart';

import '../shared/styles/colors.dart';

class NewsArticleScreen extends StatelessWidget {
  static const String routeName = "NewsArticleScreen";

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)?.settings.arguments as Articles;

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
          title: Text("News App"),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                args.title ?? "",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              Image.network(
                args.urlToImage ?? "",
                height: 250,
              ),

              Text(
                args.description ?? "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                args.content ?? "",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
