import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class Watchlist extends StatelessWidget {
  const Watchlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Watchlist',
      style: TextStyle(
        color: kGreyColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
