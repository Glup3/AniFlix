import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
