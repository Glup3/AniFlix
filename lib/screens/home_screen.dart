import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      android: _buildAndroidHome,
      ios: _buildIOSHome,
    );
  }

  Widget _buildAndroidHome(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('AniFlix'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Winter'),
              Tab(text: 'Spring'),
              Tab(text: 'Summer'),
              Tab(text: 'Fall'),
            ],
          ),
          actions: <Widget>[
            _buildPopupMenu(),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Text('Winter1'),
            Text('Winter2'),
            Text('Winter3'),
            Text('Winter4'),
          ],
        ),
        drawer: _buildDrawer(),
      ),
    );
  }

  Widget _buildIOSHome(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: _buildCupertinoTabBar(),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('AniFlix'),
              ),
              child: Center(
                child: Text('Wie die Homepage aussehen könnte'),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCupertinoTabBar() {
    return CupertinoTabBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.tv)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bookOpen)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cog)),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Text('DGlup3'),
            ),
            accountName: Text('Der User?'),
            accountEmail: Text('XD'),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.tv),
            title: Text('Anime'),
            onTap: () {},
            selected: true,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.bookOpen),
            title: Text('Manga'),
            onTap: () {},
            selected: false,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.chartLine),
            title: Text('Trending'),
            onTap: () {},
            selected: false,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Reviews'),
            onTap: () {},
            selected: false,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.newspaper),
            title: Text('News'),
            onTap: () {},
            selected: false,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.userAlt),
            title: Text('User'),
            onTap: () {},
            selected: false,
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.tint),
            title: Text('Theme'),
            onTap: () {},
            selected: false,
          ),
        ],
      ),
    );
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<MenuOption>(
      onSelected: _onMenuClick,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuOption>>[
            PopupMenuItem<MenuOption>(
              value: MenuOption.settings,
              child: Text('Settings'),
            ),
            PopupMenuItem<MenuOption>(
              value: MenuOption.donate,
              child: Text('Donate'),
            ),
            PopupMenuItem<MenuOption>(
              value: MenuOption.about,
              child: Text('About'),
            ),
          ],
    );
  }

  void _onMenuClick(MenuOption option) {
    switch (option) {
      case MenuOption.settings:
        //TODO Navigate to Settings Screen
        break;
      default:
        break;
    }
  }
}

enum MenuOption { settings, donate, about }
