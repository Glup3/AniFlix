import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';

import 'package:anilife/widgets/grids/anime_grid.dart';
import 'package:anilife/widgets/popup_menu.dart';
import 'package:anilife/widgets/my_drawer.dart';

import 'package:anilife/enums/media_format.dart';
import 'package:anilife/enums/media_season.dart';

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
          title: Text('AniLife'),
          bottom: TabBarNoRipple(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            isScrollable: true,
            tabs: _getAnimeTabBarMenus(),
          ),
          actions: <Widget>[
            PopupMenu(),
          ],
        ),
        body: TabBarView(
          children: _getAnimeTabs(),
        ),
        drawer: MySideDrawer(tilePosition: 0,),
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
