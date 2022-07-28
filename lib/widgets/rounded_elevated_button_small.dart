import 'package:flutter/material.dart';

class RoundedElevatedButtonSmall extends StatelessWidget {
  const RoundedElevatedButtonSmall({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.color,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.all(12.0),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        fixedSize: const Size.fromWidth(125),
      ),
      onPressed: () => onPressed(),
      child: Text(title),
    );
  }
}
