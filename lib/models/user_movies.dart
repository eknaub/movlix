import 'package:cloud_firestore/cloud_firestore.dart';

enum UserMoviesEnum { favorites, watchlist, recent }

class UserMovies {
  static Future<String> onFavoriteMoviePressed(
      {required int movieId, required String? userEmail}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userEmail: userEmail, fieldName: UserMoviesEnum.favorites);
    List<int> favorites = favoritesDyn.cast<int>();
    bool exists = true;
    //If movieid already exists, remove it, else add it
    if (favorites.contains(movieId)) {
      favorites.remove(movieId);
      exists = false;
    } else {
      favorites.add(movieId);
      favorites = favorites.toSet().toList(); //remove dupes
    }
    if (userEmail != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({'favorites': favorites});
      return Future.value(exists ? 'added' : 'removed');
    }
    return Future.value('');
  }

  static Future<String> onWatchlistMoviePressed(
      {required int movieId, required String? userEmail}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userEmail: userEmail, fieldName: UserMoviesEnum.watchlist);
    List<int> watchlist = favoritesDyn.cast<int>();
    bool exists = true;
    if (watchlist.contains(movieId)) {
      watchlist.remove(movieId);
      exists = false;
    } else {
      watchlist.add(movieId);
      watchlist = watchlist.toSet().toList();
    }
    if (userEmail != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({'watchlist': watchlist});
      return Future.value(exists ? 'added' : 'removed');
    }
    return Future.value('');
  }

  static Future<String> onRecentMoviePressed(
      {required int movieId, required String? userEmail}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userEmail: userEmail, fieldName: UserMoviesEnum.recent);
    List<int> recent = favoritesDyn.cast<int>();
    bool exists = true;
    if (recent.contains(movieId)) {
      recent.remove(movieId);
      exists = false;
    } else {
      recent.add(movieId);
      recent = recent.toSet().toList();
    }
    if (userEmail != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .update({'recent': recent});
      return Future.value(exists ? 'added' : 'removed');
    }
    return Future.value('');
  }

  static Future<List<dynamic>> getFieldDataFromDatabase(
      {required String? userEmail, required UserMoviesEnum fieldName}) async {
    if (userEmail == null) return [];
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final snapshot = await users.doc(userEmail).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data.containsKey(fieldName.name)
        ? Future.value(data[fieldName.name])
        : Future.value([]);
  }
}
