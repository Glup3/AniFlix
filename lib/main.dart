import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:aniflix/data/queries.dart' as queries;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HttpLink link = HttpLink(
      uri: 'https://graphql.anilist.co'
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: InMemoryCache(),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
