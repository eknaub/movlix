import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';
import 'package:movlix/models/my_app_user.dart';
import 'package:movlix/models/settings_drawer_items.dart';
import 'package:movlix/screens/main/components/custom_drawer_item.dart';
import 'package:movlix/utils/constants.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final MyAppUser? user = Provider.of<MyAppUser?>(context);

    int selectedIndex = 0;
    List<DrawerItem> settingsItems = SettingsDrawerItems.getSettingsItems();

    //TODO: yo
    return Row(
      children: [
        Drawer(
          width: 180,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: kDrawerColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: kGreyColor,
                      child: Text(
                        user != null ? user.email![0] : 'A',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    _buildEmail(user?.email),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: settingsItems.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CustomDrawerItem(
                    title: settingsItems[index].title,
                    iconData: settingsItems[index].iconData,
                    selectedIconData: settingsItems[index].selectedIconData,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(
                        () => {
                          selectedIndex = index,
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        const Expanded(
          child: Placeholder(),
        ),
      ],
    );
  }

  RichText _buildEmail(String? userEmail) {
    List<String>? email;
    if (userEmail != null) {
      email = userEmail.split('@');
      return RichText(
        text: TextSpan(
          text: email.first,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          children: [
            const TextSpan(
              text: '@',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: email.last,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: const TextSpan(
          text: 'anonymous',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      );
    }
  }
}
