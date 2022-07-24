import 'package:flutter/material.dart';
import 'package:movlix/models/my_app_user.dart';
import 'package:movlix/services/firebase_auth_service.dart';
import 'package:movlix/utils/constants.dart';

class MovieCard extends StatefulWidget {
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

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  MyAppUser? loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    loggedInUser = await _auth.currentUser();
  }

  final String baseUrl = "https://image.tmdb.org/t/p/original";

  bool isFavPressed = false;
  bool isWatchlistPressed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kScaffoldColor,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(baseUrl + widget.image),
                  fit: BoxFit.fill),
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
                      onPressed: () {
                        setState(() {
                          isFavPressed = !isFavPressed;
                        });
                        print(
                            "add ${widget.title} to favorites ${loggedInUser?.email}");
                      },
                      child: isFavPressed
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white.withOpacity(0.3),
                        padding: const EdgeInsets.all(16.0),
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        setState(() {
                          isWatchlistPressed = !isWatchlistPressed;
                        });
                        print(
                            "add ${widget.title} to watchlist ${loggedInUser?.email}");
                      },
                      child: isWatchlistPressed
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined),
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
                            widget.title,
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
                            widget.releaseDate.substring(0, 4),
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
                            widget.rating,
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
                      onPressed: () {
                        print(
                            "add ${widget.title} to recently played ${loggedInUser?.email}");
                      },
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
