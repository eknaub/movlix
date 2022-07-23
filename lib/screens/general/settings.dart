import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Settings',
      style: TextStyle(
        color: kGreyColor,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
