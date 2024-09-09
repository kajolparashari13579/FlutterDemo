import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoflutter/sharedViews/cachedimagenetwork.dart';
import 'package:flutter/material.dart';

import 'NewsModel.dart';


class NewsDetailPage extends StatefulWidget {
  Article article;

  NewsDetailPage({super.key, required this.article});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: Column(
        children: [
          widget.article.urlToImage == null ||
                  widget.article.urlToImage!.trim() == ""
              ? Container(
                  height: 250,
                  child: CachedImage(
                    imageURL:
                        "https://fastly.picsum.photos/id/739/200/300.jpg?hmac=xApsFbHx511SUVG612QiltrATotVTYu3Q4wfvGyYC1g",
                  ),
                )
              : Card(
                  margin: EdgeInsets.all(10),
                  child: CachedImage(
                    imageURL: widget.article.urlToImage!,
                  ),
                ),

          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.article.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.article.description!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Author: " + widget.article.author!),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Source: "+widget.article.source.name),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
