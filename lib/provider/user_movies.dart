import 'package:flutter/material.dart';

//TODO: Add movieId to users database

class UserMoviesProvider with ChangeNotifier {
  final List<int> _favList = [];
  List get favList => _favList;

  void addToFavList({required int movieId}) {
    _favList.add(movieId);
    notifyListeners();
  }

  void removeFromFavList({required int movieId}) {
    _favList.remove(movieId);
    notifyListeners();
  }

  final List<int> _watchlistList = [];
  List get watchlistList => _watchlistList;

  void addToWatchlistList({required int movieId}) {
    _watchlistList.add(movieId);
    notifyListeners();
  }

  void removeFromWatchlistList({required int movieId}) {
    _watchlistList.remove(movieId);
    notifyListeners();
  }

  final List<int> _recentList = [];
  List get recentList => _recentList;

  void addToRecentList({required int movieId}) {
    _recentList.add(movieId);
    notifyListeners();
  }

  void removeFromRecentList({required int movieId}) {
    _recentList.remove(movieId);
    notifyListeners();
  }
}
