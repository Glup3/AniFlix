import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:anilife/screens/home_screen.dart';
import 'package:anilife/screens/manga_screen.dart';

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

    String title = 'AniLife';

    return GraphQLProvider(
      client: client,
      child: PlatformApp(
        android: (_) => MaterialAppData(
              title: title,
              theme: ThemeData(
                primaryColor: Colors.blue,
                accentColor: Colors.blueAccent,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => HomeScreen(),
                '/manga': (content) => MangaScreen(),
              }
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
