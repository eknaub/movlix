import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';
import 'package:movlix/models/drawer_items.dart';
import 'package:movlix/models/my_app_user.dart';
import 'package:movlix/screens/movies/components/custom_drawer_header.dart';
import 'package:movlix/screens/movies/components/custom_drawer_item.dart';
import 'package:movlix/screens/movies/components/custom_drawer_title.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  MyAppUser? loggedInUser;

  int selectedMenuIndex = 0;
  int selectedLibraryIndex = -1;
  int selectedGeneralIndex = -1;
  List<DrawerItem> menuItems = DrawerItems.getMenuItems();
  List<DrawerItem> libraryItems = DrawerItems.getLibraryItems();
  List<DrawerItem> generalItems = DrawerItems.getGeneralItems();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await _auth.currentUser();
    print(loggedInUser?.email);
  }

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
                const SizedBox(
                  height: 12.0,
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.logout,
                    color: kGreyColor,
                  ),
                  label: const Text(
                    'Log out',
                    style: TextStyle(
                      color: kGreyColor,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () async {
                    await _auth.signOut();
                    if (!mounted) return;
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kDrawerColor,
                    onPrimary: kScaffoldColor,
                    shadowColor: Colors.transparent,
                  ),
                )
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
