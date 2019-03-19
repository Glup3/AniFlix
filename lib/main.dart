import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return PlatformWidget(
      android: (_) => Scaffold(
            appBar: AppBar(
              title: Text('AniFlix'),
            ),
            body: HomeScreen(),
            drawer: Drawer(),
          ),
      ios: (_) => CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.tv)),
                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bookOpen)),
                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search)),
                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user)),
                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cog)),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text('What is this'),
                    ),
                    child: HomeScreen(),
                  );
                },
              );
            },
          ),
    );
  }
}
