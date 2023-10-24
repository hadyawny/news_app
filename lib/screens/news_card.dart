import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/shared/styles/colors.dart';

class NewsCard extends StatelessWidget {

  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6 , horizontal: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: primary),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage??"",
            height: 200,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color: primary,)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(articles.author??"",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.grey,),),
          Text(articles.title??"",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black,),),
          Text(articles.publishedAt?.substring(0,10)??"",style: TextStyle(),textAlign: TextAlign.right),


        ],
      ),
    );
  }
}
