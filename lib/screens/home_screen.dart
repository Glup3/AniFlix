import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';

import 'package:anilife/widgets/anime_grid.dart';

import 'package:anilife/enums/media_format.dart';
import 'package:anilife/enums/media_season.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Widget> tabBarMenuItems;
  List<Widget> tabBarItems;

  @override
  void initState() {
    super.initState();
    tabBarItems = _getAnimeTabs();
    tabBarMenuItems =_getAnimeTabBarMenus();
    tabController = TabController(vsync: this, length: tabBarMenuItems.length);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      android: _buildAndroidHome,
      ios: _buildIOSHome,
    );
  }

  Widget _buildAndroidHome(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AniLife'),
        bottom: TabBarNoRipple(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          isScrollable: true,
          tabs: tabBarMenuItems,
        ),
        actions: <Widget>[
          _buildPopupMenu(),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: tabBarItems,
      ),
      drawer: _buildDrawer(),
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
                middle: Text('AniLife'),
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

  List<Widget> _getAnimeTabBarMenus() {
    return <Widget>[
      Container(child: Tab(text: 'Winter'), width: 100),
      Container(child: Tab(text: 'Spring'), width: 100),
      Container(child: Tab(text: 'Summer'), width: 100),
      Container(child: Tab(text: 'Fall'), width: 100),
    ];
  }

  List<Widget> _getAnimeTabs() {
    return <Widget>[
      AnimeGridView(
          pageSize: 10,
          seasonYear: 2019,
          season: MediaSeason.WINTER,
          format: MediaFormat.TV),
      AnimeGridView(
          pageSize: 10,
          seasonYear: 2019,
          season: MediaSeason.SPRING,
          format: MediaFormat.TV),
      AnimeGridView(
          pageSize: 10,
          seasonYear: 2019,
          season: MediaSeason.SUMMER,
          format: MediaFormat.TV),
      AnimeGridView(
          pageSize: 10,
          seasonYear: 2019,
          season: MediaSeason.FALL,
          format: MediaFormat.TV),
    ];
  }
}

enum MenuOption { settings, donate, about }
