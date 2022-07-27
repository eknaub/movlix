import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movlix/auth_screen.dart';
import 'package:movlix/models/movie_main_selected_index.dart';
import 'package:movlix/models/my_app_user.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/utils/scroll.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MovieMainSelectedIndexProvider(),
        ),
        StreamProvider<MyAppUser?>.value(
          value: FirebaseAuthService().user,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'Movlix',
        theme: ThemeData().copyWith(
          drawerTheme: const DrawerThemeData(
            backgroundColor: kDrawerColor,
          ),
          scaffoldBackgroundColor: kScaffoldColor,
        ),
        home: const AuthUser(),
      ),
    );
  }
}
