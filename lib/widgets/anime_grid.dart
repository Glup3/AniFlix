import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:aniflix/data/queries.dart' as queries;
import 'package:flutter_pagewise/flutter_pagewise.dart';

class AnimeGridView extends StatefulWidget {
  @override
  _AnimeGridViewState createState() => _AnimeGridViewState();
}

GraphQLClient client = GraphQLClient(
  link: HttpLink(uri: 'https://graphql.anilist.co'),
  cache: InMemoryCache(),
);

class _AnimeGridViewState extends State<AnimeGridView> {

  Future<List<dynamic>> _getListOfMedias(int pageNumber, int pageSize) async {
     QueryResult result =  await client.query(
      QueryOptions(
        document: queries.getAnimesIdAndTitle,
        variables: {
          'search': 'Fate/Zero',
          'page': pageNumber,
          'perPage': pageSize,
        },
      ),
    );

    if (result.errors != null) { return null; }

    if (result.loading) { return null; }

    return result.data['Page']['media'];
  }

  @override
  Widget build(BuildContext context) {
    return PagewiseGridView.count(
      pageSize: 20,
      crossAxisCount: 2,
      itemBuilder: _buildGridTile,
      pageFuture: (int pageIndex) {
        return _getListOfMedias(pageIndex + 1, 20);
      },
    );
  }

  Widget _buildGridTile(BuildContext context, dynamic media, int index) {
    return Card(
      child: GridTile(
        footer: Text(media['title']['romaji']),
        child: Image.network(media['coverImage']['medium'])
      ),
    );
  }
}
