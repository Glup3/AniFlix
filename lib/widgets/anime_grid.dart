import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:aniflix/data/queries.dart' as queries;
import 'package:aniflix/widgets/keep_alive_future_builder.dart';

class AnimeGridView extends StatefulWidget {
  @override
  _AnimeGridViewState createState() => _AnimeGridViewState();
}

GraphQLClient client = GraphQLClient(
  link: HttpLink(uri: 'https://graphql.anilist.co'),
  cache: InMemoryCache(),
);

class _AnimeGridViewState extends State<AnimeGridView> {
  Future<QueryResult> _fetchEntries(int pageNumber, int pageSize) async {
    return await client.query(
      QueryOptions(
        document: queries.getAnimesIdAndTitle,
        variables: {
          'search': 'Fate/Zero',
          'page': pageNumber,
          'perPage': pageSize,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: queries.getAnimesIdAndTitle,
        variables: {
          'search': 'Fate/Zero',
          'page': 1,
          'perPage': 20,
        },
      ),
      builder: (QueryResult result) {
        if (result.errors != null) {
          return Text(result.errors.toString());
        }

        if (result.loading) {
          return CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: result.data['Page']['pageInfo']['lastPage'],
          itemBuilder: (BuildContext context, int pageNumber) {
            return KeepAliveFutureBuilder(
              future: this._fetchEntries(pageNumber + 1, 20),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('ERROR: ${snapshot.error}');
                    }

                    QueryResult result = snapshot.data;

                    if (result.errors != null) {
                      return Text(result.errors.toString());
                    }

                    if (result.loading) {
                      return CircularProgressIndicator();
                    }

                    return _buildPage(result.data['Page']['media']);

                  default:
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 2,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: CircularProgressIndicator()),
                    );
                }
              },
            );
          },
        );
      },
    );
  }

  //TODO relocate Widget --> Make it a tile
  Widget _buildPage(List<dynamic> listOfMedia) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: listOfMedia.map((media) {
        return ListTile(
          title: Text(media['title']['romaji']),
        );
      }).toList(),
    );
  }
}
