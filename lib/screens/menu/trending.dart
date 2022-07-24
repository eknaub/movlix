import 'package:flutter/material.dart';
import 'package:movlix/models/movie.dart';
import 'package:movlix/provider/user_movies.dart';
import 'package:movlix/services/movie_service.dart';
import 'package:movlix/utils/constants.dart';
import 'package:movlix/widgets/movie_card.dart';
import 'package:movlix/widgets/movie_sliver_grid.dart';
import 'package:provider/provider.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Trending movies',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected,
                  selectedColor: Colors.white,
                  color: kGreyColor,
                  fillColor: Colors.blueGrey.shade900,
                  renderBorder: true,
                  borderColor: kDrawerColor,
                  selectedBorderColor: kDrawerColor,
                  splashColor: Colors.blueGrey.shade900,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Daily',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Weekly',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                FutureBuilder<List<Movie>>(
                  future: MovieService.fetchMoviesTrending(isSelected[0]),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
