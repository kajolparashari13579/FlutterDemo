import 'package:demoflutter/NewsDetailPage.dart';
import 'package:flutter/material.dart';
import '../NewsModel.dart';

class CustomListItem extends StatefulWidget {
  Article article;

  CustomListItem({super.key, required this.article});

  @override
  State<CustomListItem> createState() => _ListStyleState();
}

class _ListStyleState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailPage(article: widget.article)));
        },
        child: Card(
          color: Colors.white,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.article.author!.length >= 20
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.article.author!.substring(0, 20) +
                                (widget.article.author!.length > 5
                                    ? "..."
                                    : ""),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1, // Ensure single line display
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.article.author!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1, // Ensure single line display
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.article.source.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
