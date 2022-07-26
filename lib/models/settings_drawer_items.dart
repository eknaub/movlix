import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';

class SettingsDrawerItems {
  static List<DrawerItem> getSettingsItems() {
    return [
      DrawerItem(
        title: 'Settings',
        iconData: Icons.settings_outlined,
        selectedIconData: Icons.settings,
        child: Container(),
      ),
    ];
  }
}
