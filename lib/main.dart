import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:aniflix/data/queries.dart' as queries;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HttpLink link = HttpLink(uri: 'https://graphql.anilist.co');

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: InMemoryCache(),
      ),
    );

    String title = 'AniFlix';

    return GraphQLProvider(
      client: client,
      child: PlatformApp(
        home: MyHomePage(),
        android: (_) => MaterialAppData(
              title: title,
              theme: ThemeData(
                primaryColor: Colors.blue,
                accentColor: Colors.blueAccent,
              ),
            ),
        ios: (_) => CupertinoAppData(
              title: title,
              theme: CupertinoThemeData(
                primaryColor: Colors.blue,
                primaryContrastingColor: Colors.red,
              ),
            ),
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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('AniFlix'),
        leading: PlatformIconButton(
          icon: Icon(Icons.search),
          iosIcon: Icon(CupertinoIcons.search),
        ),
      ),
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
              return PlatformText(result.errors.toString());
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
