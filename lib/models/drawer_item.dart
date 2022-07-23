import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData iconData;
  final IconData selectedIconData;
  final Widget child;

  const DrawerItem({
    required this.title,
    required this.iconData,
    required this.selectedIconData,
    required this.child,
  });
}
