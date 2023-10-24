import 'package:flutter/material.dart';
import 'package:news_app/models/sources_response.dart';
import 'package:news_app/shared/styles/colors.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;

  TabItem(this.sources, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primary)),
      child: Text(
        sources.name!,
        style: TextStyle(color: isSelected ? Colors.white : primary),
      ),
    );
  }
}
