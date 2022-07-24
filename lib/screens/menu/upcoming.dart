import 'package:flutter/material.dart';
import 'package:movlix/models/movie.dart';
import 'package:movlix/provider/user_movies.dart';
import 'package:movlix/services/movie_service.dart';
import 'package:movlix/widgets/default_movie_view.dart';
import 'package:movlix/widgets/movie_card.dart';
import 'package:movlix/widgets/movie_sliver_grid.dart';
import 'package:provider/provider.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return DefaultMovieView(
      title: 'Upcoming movies',
      futureData: FutureBuilder<List<Movie>>(
        future: MovieService.fetchMoviesUpcoming(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Movie> data = snapshot.data!;
          List<MovieCard> cards = [];
          for (var movie in data) {
            cards.add(
              MovieCard(
                movieId: movie.id,
                title: movie.title,
                image: movie.image,
                rating: movie.rating.toStringAsFixed(1),
                releaseDate: movie.releaseDate,
                onFavPressed: () {
                  context
                      .read<UserMoviesProvider>()
                      .addToFavList(movieId: movie.id);
                },
                onPlayPressed: () {
                  context
                      .read<UserMoviesProvider>()
                      .addToRecentList(movieId: movie.id);
                },
                onWatchlistPressed: () {
                  context
                      .read<UserMoviesProvider>()
                      .addToWatchlistList(movieId: movie.id);
                },
              ),
            );
          }
          return MovieSliverGrid(data: cards);
        },
      ),
    );
  }
}
