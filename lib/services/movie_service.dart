import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movlix/models/movie.dart';

const String baseUrl = "https://api.themoviedb.org/3";
const String apiKey = "a1dee4f95300a7ccb8ea185375c26fb9";

class MovieService {
  static Future<List<Movie>> fetchMoviesTrending(bool daily) async {
    return daily ? _fetchMoviesTrendingDaily() : _fetchMoviesTrendingWeekly();
  }

  static Future<List<Movie>> _fetchMoviesTrendingWeekly() async {
    String url = '$baseUrl/trending/movie/week?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['results'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  static Future<List<Movie>> _fetchMoviesTrendingDaily() async {
    String url = '$baseUrl/trending/movie/day?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['results'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  static Future<List<Movie>> fetchMoviesUpcoming() async {
    String url =
        '$baseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['results'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  static Future<List<Movie>> fetchMoviesDiscover() async {
    String url =
        '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['results'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load discovery movies');
    }
  }

  static Future<List<Movie>> fetchMoviesTopRated() async {
    String url =
        '$baseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1&region=US';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List result = data['results'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
}
