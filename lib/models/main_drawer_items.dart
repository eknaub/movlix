import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';
import 'package:movlix/screens/general/settings.dart';
import 'package:movlix/screens/library/favorites.dart';
import 'package:movlix/screens/library/recent.dart';
import 'package:movlix/screens/library/top_rated.dart';
import 'package:movlix/screens/library/watchlist.dart';
import 'package:movlix/screens/menu/discovery.dart';
import 'package:movlix/screens/menu/home.dart';
import 'package:movlix/screens/menu/trending.dart';
import 'package:movlix/screens/menu/upcoming.dart';

class MainDrawerItems {
  static List<DrawerItem> getMenuItems() {
    return const [
      DrawerItem(
        title: 'Home',
        iconData: Icons.home_outlined,
        selectedIconData: Icons.home,
        child: Home(),
      ),
      DrawerItem(
        title: 'Discovery',
        iconData: Icons.find_in_page_outlined,
        selectedIconData: Icons.find_in_page,
        child: Discovery(),
      ),
      DrawerItem(
        title: 'Trending',
        iconData: Icons.local_fire_department_outlined,
        selectedIconData: Icons.local_fire_department,
        child: Trending(),
      ),
      DrawerItem(
        title: 'Upcoming',
        iconData: Icons.timer_outlined,
        selectedIconData: Icons.timer,
        child: Upcoming(),
      ),
    ];
  }

  static List<DrawerItem> getLibraryItems() {
    return const [
      DrawerItem(
        title: 'Recent',
        iconData: Icons.access_time_outlined,
        selectedIconData: Icons.access_time_filled,
        child: Recent(),
      ),
      DrawerItem(
        title: 'Favorites',
        iconData: Icons.favorite_outline,
        selectedIconData: Icons.favorite,
        child: Favorites(),
      ),
      DrawerItem(
        title: 'Watchlist',
        iconData: Icons.remove_red_eye_outlined,
        selectedIconData: Icons.remove_red_eye,
        child: Watchlist(),
      ),
      DrawerItem(
        title: 'Top rated',
        iconData: Icons.star_border_outlined,
        selectedIconData: Icons.star,
        child: TopRated(),
      ),
    ];
  }

  static List<DrawerItem> getGeneralItems() {
    return const [
      DrawerItem(
        title: 'Settings',
        iconData: Icons.settings_outlined,
        selectedIconData: Icons.settings,
        child: Settings(),
      ),
    ];
  }
}
