import 'package:flutter/material.dart';

class ContentCover extends StatelessWidget {
  final String imageURL;
  final String title;
  final String subTextOne;
  final String subTextTwo;

  ContentCover({Key key, this.imageURL, this.title, this.subTextOne, this.subTextTwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageURL,
        fit: BoxFit.fill,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black.withOpacity(0.75),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('$subTextOne\n$subTextTwo'),
      ),
    );
  }
}
