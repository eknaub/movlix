import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';
import 'package:movlix/screens/movies/components/custom_drawer_header.dart';
import 'package:movlix/screens/movies/components/custom_drawer_item.dart';
import 'package:movlix/screens/movies/components/custom_drawer_title.dart';
import 'package:movlix/utils/constants.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int selectedMenuIndex = 0;
  int selectedLibraryIndex = -1;
  int selectedGeneralIndex = -1;

  List<DrawerItem> menuItems = const [
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

  List<DrawerItem> libraryItems = const [
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

  List<DrawerItem> generalItems = const [
    DrawerItem(
      title: 'Settings',
      iconData: Icons.settings_outlined,
      selectedIconData: Icons.settings,
    ),
    DrawerItem(
      title: 'Log out',
      iconData: Icons.logout_outlined,
      selectedIconData: Icons.logout,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const CustomDrawerHeader(),
                const CustomDrawerTitle(
                  title: 'MENU',
                ),
                ListView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomDrawerItem(
                      title: menuItems[index].title,
                      iconData: menuItems[index].iconData,
                      selectedIconData: menuItems[index].selectedIconData,
                      isSelected: selectedMenuIndex == index,
                      onTap: () {
                        setState(
                          () => {
                            selectedMenuIndex = index,
                            selectedLibraryIndex = -1,
                            selectedGeneralIndex = -1,
                          },
                        );
                      },
                    );
                  },
                ),
                const Divider(
                  color: kGreyColor,
                  endIndent: 25,
                  indent: 25,
                ),
                const CustomDrawerTitle(
                  title: 'LIBRARY',
                ),
                ListView.builder(
                  itemCount: libraryItems.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomDrawerItem(
                      title: libraryItems[index].title,
                      iconData: libraryItems[index].iconData,
                      selectedIconData: libraryItems[index].selectedIconData,
                      isSelected: selectedLibraryIndex == index,
                      onTap: () {
                        setState(
                          () => {
                            selectedMenuIndex = -1,
                            selectedLibraryIndex = index,
                            selectedGeneralIndex = -1,
                          },
                        );
                      },
                    );
                  },
                ),
                const Divider(
                  color: kGreyColor,
                  endIndent: 25,
                  indent: 25,
                ),
                const CustomDrawerTitle(
                  title: 'GENERAL',
                ),
                ListView.builder(
                  itemCount: generalItems.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomDrawerItem(
                      title: generalItems[index].title,
                      iconData: generalItems[index].iconData,
                      selectedIconData: generalItems[index].selectedIconData,
                      isSelected: selectedGeneralIndex == index,
                      onTap: () {
                        setState(
                          () => {
                            selectedMenuIndex = -1,
                            selectedLibraryIndex = -1,
                            selectedGeneralIndex = index,
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                getSelectedWidget(),
                style: const TextStyle(
                  color: kGreyColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getSelectedWidget() {
    if (selectedMenuIndex != -1) {
      return menuItems[selectedMenuIndex].title;
    } else if (selectedLibraryIndex != -1) {
      return libraryItems[selectedLibraryIndex].title;
    } else /*(selectedGeneralIndex != -1)*/ {
      return generalItems[selectedGeneralIndex].title;
    }
  }
}
