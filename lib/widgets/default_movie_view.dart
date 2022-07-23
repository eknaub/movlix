import 'package:flutter/material.dart';
import 'package:movlix/models/movie.dart';

class DefaultMovieView extends StatelessWidget {
  const DefaultMovieView(
      {Key? key, required this.title, required this.futureData})
      : super(key: key);

  final String title;
  final FutureBuilder<List<Movie>> futureData;

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
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                futureData,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
