import 'dart:convert';

import 'package:demoflutter/sharedViews/listItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'NewsProvider.dart';


class TrendingNewsPage extends StatefulWidget {

  TrendingNewsPage({super.key});

  @override
  State<TrendingNewsPage> createState() => _TrendingNewsPageState();
}

class _TrendingNewsPageState extends State<TrendingNewsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///fetchTrendingData
    Provider.of<NewsProvider>(context, listen: false).fetchTrendingData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Consumer<NewsProvider>(
            builder: (context, provider, child) {
              final articles = provider.trendingArticles;
              if (articles == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final dataItem = articles[index];
                  return CustomListItem(article: dataItem);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
