import 'dart:convert';

import 'package:demoflutter/sharedViews/listItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'NewsProvider.dart';


class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
     super.initState();
    Provider.of<NewsProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Consumer<NewsProvider>(
            builder: (context, provider, child) {
              final articles = provider.articles;
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
