import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {Key? key,
      required this.title,
      required this.releaseDate,
      required this.rating,
      required this.image})
      : super(key: key);

  final String title;
  final String releaseDate;
  final String rating;
  final String image;

  final String baseUrl = "https://image.tmdb.org/t/p/original";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kScaffoldColor,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(baseUrl + image), fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.3),
                        padding: const EdgeInsets.all(16.0),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.favorite_outline),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.3),
                        padding: const EdgeInsets.all(16.0),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            releaseDate.substring(0, 4),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                            rating,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.withOpacity(0.8),
                        padding: const EdgeInsets.all(16.0),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.play_arrow),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}