import 'package:flutter/material.dart';
import 'package:movlix/models/my_app_user.dart';
import 'package:movlix/screens/login/login_screen.dart';
import 'package:movlix/screens/main/movie_main_screen.dart';
import 'package:provider/provider.dart';

class AuthUser extends StatelessWidget {
  const AuthUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyAppUser? user = Provider.of<MyAppUser?>(context);

    if (user != null) {
      return const MovieScreen();
    } else {
      return const LoginScreen();
    }
  }
}
