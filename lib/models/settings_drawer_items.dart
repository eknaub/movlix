import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';
import 'package:movlix/screens/general/components/about.dart';
import 'package:movlix/screens/general/components/billing_plan.dart';
import 'package:movlix/screens/general/components/edit_profile.dart';
import 'package:movlix/screens/general/components/help.dart';
import 'package:movlix/screens/general/components/password_security.dart';
import 'package:movlix/screens/general/components/preferences.dart';

class SettingsDrawerItems {
  static List<DrawerItem> getSettingsItems() {
    return const [
      DrawerItem(
        title: 'Edit profile',
        iconData: Icons.edit_outlined,
        selectedIconData: Icons.edit,
        child: EditProfile(),
      ),
      DrawerItem(
        title: 'Billing plan',
        iconData: Icons.money_outlined,
        selectedIconData: Icons.money,
        child: BillingPlan(),
      ),
      DrawerItem(
        title: 'Password & Security',
        iconData: Icons.security_outlined,
        selectedIconData: Icons.security,
        child: PasswordSecurity(),
      ),
      DrawerItem(
        title: 'Preferences',
        iconData: Icons.remove_red_eye_outlined,
        selectedIconData: Icons.remove_red_eye,
        child: Preferences(),
      ),
      DrawerItem(
        title: 'Help',
        iconData: Icons.help_outline_outlined,
        selectedIconData: Icons.help_outline,
        child: Help(),
      ),
      DrawerItem(
        title: 'About',
        iconData: Icons.info_outline,
        selectedIconData: Icons.info,
        child: About(),
      ),
    ];
  }
}
