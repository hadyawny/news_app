import 'package:flutter/material.dart';
import 'package:news_app/screens/tab_item.dart';

import '../models/sources_response.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: TabBar(
          onTap: (index){
            selectedIndex=index;
            setState(() {

            });
          },
          indicatorColor: Colors.transparent,
          isScrollable: true,
          tabs: widget.sources
              .map((source) => Tab(
                    child: TabItem(source, widget.sources.indexOf(source)==selectedIndex)
                  ))
              .toList(),
        ));
  }
}
