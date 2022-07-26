import 'package:flutter/material.dart';
import 'package:movlix/models/movie.dart';
import 'package:movlix/utils/constants.dart';

class CustomDialogs {
  static void favoriteSuccessDialog(
      {required BuildContext context,
      required String val,
      required Movie movie,
      required Function func}) {
    String connect = val == 'added' ? 'to' : 'from';

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'You successfully $val the movie \'${movie.title}\' $connect your favorites.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kDrawerColor,
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              func();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static void watchlistSuccessDialog(
      {required BuildContext context,
      required String val,
      required Movie movie,
      required Function func}) {
    String connect = val == 'added' ? 'to' : 'from';

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Watchlist',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'You successfully $val the movie \'${movie.title}\' $connect your watchlist.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kDrawerColor,
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              func();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static void recentSuccessDialog(
      {required BuildContext context,
      required String val,
      required Movie movie,
      required Function func}) {
    String connect = val == 'added' ? 'to' : 'from';

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Recent',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'You successfully $val the movie \'${movie.title}\' $connect your recent list.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kDrawerColor,
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {
              func();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static void anonModeDialog(
      {required BuildContext context, required Function func}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Anonymous mode',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Function not available in anonymous mode.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kDrawerColor,
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              func();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  static void releaseModeDialog(
      {required BuildContext context, required Function func}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Release mode',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Function not available in release mode.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kDrawerColor,
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: () {
              func();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
