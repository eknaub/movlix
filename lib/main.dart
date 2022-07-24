import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movlix/screens/login/login_screen.dart';
import 'package:movlix/screens/main/movie_main_screen.dart';
import 'package:movlix/utils/constants.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movlix',
      theme: ThemeData().copyWith(
        drawerTheme: const DrawerThemeData(
          backgroundColor: kDrawerColor,
        ),
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MovieScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
