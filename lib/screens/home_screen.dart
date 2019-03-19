import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:aniflix/data/queries.dart' as queries;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Query(
        options: QueryOptions(
          document: queries.getAnimeIdAndTitle,
          variables: {
            'id': 1,
          },
        ),
        builder: (QueryResult result) {
          if (result.errors != null) {
            return Text(result.errors.toString());
          }

          if (result.loading) {
            return CircularProgressIndicator();
          }

          return Text(result.data['Media']['title']['english']);
        },
      ),
    );
  }
}
