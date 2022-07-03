import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movlix/screens/movies/movie_main_screen.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple.shade800,
            padding: const EdgeInsets.all(24.0),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            fixedSize: const Size.fromWidth(150),
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: kDrawerColor,
        ),
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: const MovieScreen(),
    );
  }
}
