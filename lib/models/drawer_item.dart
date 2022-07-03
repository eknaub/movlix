import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData iconData;
  final IconData selectedIconData;

  const DrawerItem({
    required this.title,
    required this.iconData,
    required this.selectedIconData,
  });
}
