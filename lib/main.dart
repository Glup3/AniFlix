import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:aniflix/screens/home_screen.dart';

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
        home: HomeScreen(),
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
