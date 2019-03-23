import 'package:flutter/material.dart';

class CoverCard extends StatelessWidget {

  final int index;
  final dynamic media;

  CoverCard({Key key, this.index, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: GridTile(
        footer: Text(media['title']['romaji']),
        child: Image.network(media['coverImage']['medium'])
      ),
    );
  }
}