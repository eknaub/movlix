import 'package:cloud_firestore/cloud_firestore.dart';

enum UserMoviesEnum { favorites, watchlist, recent }

class UserMovies {
  static Future<void> addToFavList(
      {required int movieId, required String? userEmail}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userEmail: userEmail, fieldName: UserMoviesEnum.favorites);
    List<int> favorites = favoritesDyn.cast<int>();
    //If movieid already exists, remove it, else add it
    if (favorites.contains(movieId)) {
      favorites.remove(movieId);
    } else {
      favorites.add(movieId);
      favorites = favorites.toSet().toList(); //remove dupes
    }
    if (userEmail != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({'favorites': favorites});
    }
  }

  static Future<void> addToWatchlistList(
      {required int movieId, required String? userEmail}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userEmail: userEmail, fieldName: UserMoviesEnum.watchlist);
    List<int> watchlist = favoritesDyn.cast<int>();
    if (watchlist.contains(movieId)) {
      watchlist.remove(movieId);
    } else {
      watchlist.add(movieId);
      watchlist = watchlist.toSet().toList();
    }
    if (userEmail != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({'watchlist': watchlist});
    }
  }

  static Future<void> addToRecentList(
      {required int movieId, required String? userEmail}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userEmail: userEmail, fieldName: UserMoviesEnum.recent);
    List<int> recent = favoritesDyn.cast<int>();
    if (recent.contains(movieId)) {
      recent.remove(movieId);
    } else {
      recent.add(movieId);
      recent = recent.toSet().toList();
    }
    if (userEmail != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({'recent': recent});
    }
  }

  static Future<List<dynamic>> getFieldDataFromDatabase(
      {required String? userEmail, required UserMoviesEnum fieldName}) async {
    if (userEmail == null) return [];
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot = await users.doc(userEmail).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data.containsKey(fieldName.name) ? data[fieldName.name] : [];
  }
}
