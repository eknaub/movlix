import 'package:flutter/material.dart';
import 'package:movlix/models/my_app_user.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  MyAppUser? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await _auth.currentUser();
    print("Current user ${loggedInUser?.email}");
  }

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Favorites',
      style: TextStyle(
        color: kGreyColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
