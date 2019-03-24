import 'package:flutter/material.dart';

class CoverCard extends StatelessWidget {
  final int index;
  final dynamic media;

  CoverCard({Key key, this.index, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: GridTile(
              child: Image.network(
                media['coverImage']['large'],
                fit: BoxFit.fill,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black.withOpacity(0.75),
                title: Text(
                  media['title']['romaji'],
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text('${media['format']} - ${media['episodes']}'),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
