import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/screens/tab_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/styles/colors.dart';

import '../models/sources_response.dart';
import 'news_card.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;
  String search;

  TabControllerScreen(this.sources, this.search, {super.key});

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => Tab(
                      child: TabItem(source,
                          widget.sources.indexOf(source) == selectedIndex)))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future: ApiManager.getNewsData(
              widget.sources[selectedIndex].id ?? "", widget.search),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primary,
                ),
              );
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? "Has Error"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Try Again"),
                  )
                ],
              );
            }
            if (snapshot.data?.status != "ok") {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? "Has Error"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Try Again"),
                  )
                ],
              );
            }

            var news = snapshot.data?.articles ?? [];

            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsCard(news[index]);
                },
                itemCount: news.length,
              ),
            );
          },
        )
      ],
    );
  }
}
