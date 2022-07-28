import 'package:cloud_firestore/cloud_firestore.dart';

enum UserMoviesEnum { favorites, watchlist, recent }

class UserMovies {
  static Future<String> onFavoriteMoviePressed(
      {required int movieId, required String? userId}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userId: userId, fieldName: UserMoviesEnum.favorites);
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
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set({'favorites': favorites}, SetOptions(merge: true));
    return Future.value(exists ? 'added' : 'removed');
  }

  static Future<String> onWatchlistMoviePressed(
      {required int movieId, required String? userId}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userId: userId, fieldName: UserMoviesEnum.watchlist);
    List<int> watchlist = favoritesDyn.cast<int>();
    bool exists = true;
    if (watchlist.contains(movieId)) {
      watchlist.remove(movieId);
      exists = false;
    } else {
      watchlist.add(movieId);
      watchlist = watchlist.toSet().toList();
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set({'watchlist': watchlist}, SetOptions(merge: true));
    return Future.value(exists ? 'added' : 'removed');
  }

  static Future<String> onRecentMoviePressed(
      {required int movieId, required String? userId}) async {
    List<dynamic> favoritesDyn = await getFieldDataFromDatabase(
        userId: userId, fieldName: UserMoviesEnum.recent);
    List<int> recent = favoritesDyn.cast<int>();
    bool exists = true;
    if (recent.contains(movieId)) {
      recent.remove(movieId);
      exists = false;
    } else {
      recent.add(movieId);
      recent = recent.toSet().toList();
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set({'recent': recent}, SetOptions(merge: true));
    return Future.value(exists ? 'added' : 'removed');
  }

  static Future<List<dynamic>> getFieldDataFromDatabase(
      {required String? userId, required UserMoviesEnum fieldName}) async {
    if (userId == null) return [];
    DocumentReference<Object?> user =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final snapshot = await user.get();
    if (!snapshot.exists) return [];
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data.containsKey(fieldName.name)
        ? Future.value(data[fieldName.name])
        : Future.value([]);
  }
}
