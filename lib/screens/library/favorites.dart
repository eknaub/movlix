import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Favorites',
      style: TextStyle(
        color: kGreyColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
