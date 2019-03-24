import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MySideDrawer extends StatefulWidget {

  final int tilePosition;

  MySideDrawer({Key key, this.tilePosition}) : super (key: key);

  @override
  _MySideDrawerState createState() => _MySideDrawerState();
}

class _MySideDrawerState extends State<MySideDrawer> {

  List<bool> activatedTiles = [false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    setState(() {
      activatedTiles[widget.tilePosition] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            onTap: () => _onTileTap(0),
            selected: activatedTiles[0],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.bookOpen),
            title: Text('Manga'),
            onTap: () => _onTileTap(1),
            selected: activatedTiles[1],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.chartLine),
            title: Text('Trending'),
            onTap: () => _onTileTap(2),
            selected: activatedTiles[2],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text('Reviews'),
            onTap: () => _onTileTap(3),
            selected: activatedTiles[3],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.newspaper),
            title: Text('News'),
            onTap: () => _onTileTap(4),
            selected: activatedTiles[4],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.userAlt),
            title: Text('User'),
            onTap: () => _onTileTap(5),
            selected: activatedTiles[5],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.tint),
            title: Text('Theme'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _onTileTap(int position) {
    Navigator.pop(context);
    if (position != widget.tilePosition) {
      switch (position) {
        case 0: Navigator.pushNamed(context, '/'); break;
        case 1: Navigator.pushNamed(context, '/manga'); break;
        //TODO add other Screens
        default: break;
      }
    }
  }
}