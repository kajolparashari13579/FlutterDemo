import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatefulWidget {
  String imageURL;

  CachedImage({super.key, required this.imageURL});

  @override
  State<CachedImage> createState() => _CachedImageState();
}

class _CachedImageState extends State<CachedImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageURL,
      imageBuilder: (context, imageProvider) => Container(
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Center(child: CircularProgressIndicator())),
      errorWidget: (context, url, error) => Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Icon(Icons.error)),
    );
  }
}
