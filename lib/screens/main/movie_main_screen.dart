import 'package:flutter/material.dart';
import 'package:movlix/models/drawer_item.dart';
import 'package:movlix/models/main_drawer_items.dart';
import 'package:movlix/models/movie_main_selected_index.dart';
import 'package:movlix/screens/main/components/custom_drawer_header_logo.dart';
import 'package:movlix/screens/main/components/custom_drawer_item.dart';
import 'package:movlix/screens/main/components/custom_drawer_title.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  List<DrawerItem> menuItems = MainDrawerItems.getMenuItems();
  List<DrawerItem> libraryItems = MainDrawerItems.getLibraryItems();
  List<DrawerItem> generalItems = MainDrawerItems.getGeneralItems();

  @override
  Widget build(BuildContext context) {
    int selectedMenuIndex =
        Provider.of<MovieMainSelectedIndexProvider>(context).selectedMenuIndex;
    int selectedLibraryIndex =
        context.watch<MovieMainSelectedIndexProvider>().selectedLibraryIndex;
    int selectedGeneralIndex =
        context.watch<MovieMainSelectedIndexProvider>().selectedGeneralIndex;
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            width: 200,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const CustomDrawerHeaderLogo(),
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
                            context
                                .read<MovieMainSelectedIndexProvider>()
                                .updateMenuIndex(index),
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
                            context
                                .read<MovieMainSelectedIndexProvider>()
                                .updateLibraryIndex(index),
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
                            context
                                .read<MovieMainSelectedIndexProvider>()
                                .updateGeneralIndex(index),
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
            child: showSelectedWidget(
                selectedMenuIndex: selectedMenuIndex,
                selectedGeneralIndex: selectedGeneralIndex,
                selectedLibraryIndex: selectedLibraryIndex),
          ),
        ],
      ),
    );
  }

  Widget showSelectedWidget(
      {required int selectedMenuIndex,
      required int selectedLibraryIndex,
      required int selectedGeneralIndex}) {
    if (selectedMenuIndex != -1) {
      return menuItems[selectedMenuIndex].child;
    } else if (selectedLibraryIndex != -1) {
      return libraryItems[selectedLibraryIndex].child;
    } else /*(selectedGeneralIndex != -1)*/ {
      return generalItems[selectedGeneralIndex].child;
    }
  }
}
