import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class CustomDrawerTitle extends StatelessWidget {
  final String title;
  const CustomDrawerTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: kGreyColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
