import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';

import 'package:anilife/widgets/popup_menu.dart';
import 'package:anilife/widgets/grids/manga_grid.dart';
import 'package:anilife/widgets/my_drawer.dart';
import 'package:anilife/util/string_helper.dart';

import 'package:anilife/enums/media_format.dart';
import 'package:anilife/enums/media_sort.dart';

class MangaScreen extends StatefulWidget {
  @override
  _MangaScreenState createState() => _MangaScreenState();
}

class _MangaScreenState extends State<MangaScreen> {
  final int perPage = 10;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      android: _buildAndroidHome,
      ios: _buildIOSHome,
    );
  }

  Widget _buildAndroidHome(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('AniLife'),
          bottom: TabBarNoRipple(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            isScrollable: true,
            tabs: _getMangaTabBarMenus(),
          ),
          actions: <Widget>[
            PopupMenu(),
          ],
        ),
        body: TabBarView(
          children: _getMangaTabs(),
        ),
        drawer: MySideDrawer(tilePosition: 1,),
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

  List<Widget> _getMangaTabBarMenus() {
    return <Widget>[
      Container(child: Tab(text: 'Most Popular'), width: 100),
      Container(child: Tab(text: 'Best Score'), width: 100),
      Container(child: Tab(text: 'Last Updated'), width: 100),
    ];
  }

  List<Widget> _getMangaTabs() {
    return <Widget>[
      MangaGrid(
        variables: {
          "perPage": perPage,
          "sort": StringHelper.getStringValueOfEnum(MediaSort.POPULARITY_DESC),
          'format': StringHelper.getStringValueOfEnum(MediaFormat.MANGA),
        },
        pageSize: perPage,
      ),
      MangaGrid(
        variables: {
          "perPage": perPage,
          "sort": StringHelper.getStringValueOfEnum(MediaSort.SCORE_DESC),
          'format': StringHelper.getStringValueOfEnum(MediaFormat.MANGA),
        },
        pageSize: perPage,
      ),
      MangaGrid(
        variables: {
          "perPage": perPage,
          "sort": StringHelper.getStringValueOfEnum(MediaSort.UPDATED_AT_DESC),
          'format': StringHelper.getStringValueOfEnum(MediaFormat.MANGA),
        },
        pageSize: perPage,
      )
    ];
  }
}
