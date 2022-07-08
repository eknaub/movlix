import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';

class DrawerItems {
  static List<DrawerItem> getMenuItems() {
    return const [
      DrawerItem(
        title: 'Home',
        iconData: Icons.home_outlined,
        selectedIconData: Icons.home,
      ),
      DrawerItem(
        title: 'Discovery',
        iconData: Icons.find_in_page_outlined,
        selectedIconData: Icons.find_in_page,
      ),
      DrawerItem(
        title: 'Community',
        iconData: Icons.people_outline,
        selectedIconData: Icons.people,
      ),
      DrawerItem(
        title: 'Coming soon',
        iconData: Icons.timer_outlined,
        selectedIconData: Icons.timer,
      ),
    ];
  }

  static List<DrawerItem> getLibraryItems() {
    return const [
      DrawerItem(
        title: 'Recent',
        iconData: Icons.access_time_outlined,
        selectedIconData: Icons.access_time_filled,
      ),
      DrawerItem(
        title: 'Bookmarked',
        iconData: Icons.bookmark_border_outlined,
        selectedIconData: Icons.bookmark,
      ),
      DrawerItem(
        title: 'Top rated',
        iconData: Icons.star_border_outlined,
        selectedIconData: Icons.star,
      ),
      DrawerItem(
        title: 'Downloaded',
        iconData: Icons.download_outlined,
        selectedIconData: Icons.download,
      ),
    ];
  }

  static List<DrawerItem> getGeneralItems() {
    return const [
      DrawerItem(
        title: 'Settings',
        iconData: Icons.settings_outlined,
        selectedIconData: Icons.settings,
      ),
    ];
  }
}
