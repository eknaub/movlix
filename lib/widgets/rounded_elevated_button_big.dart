import 'package:flutter/material.dart';

class RoundedElevatedButtonBig extends StatelessWidget {
  const RoundedElevatedButtonBig({
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
        padding: const EdgeInsets.all(24.0),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        fixedSize: const Size.fromWidth(150),
      ),
      onPressed: () => onPressed(),
      child: Text(title),
    );
  }
}
