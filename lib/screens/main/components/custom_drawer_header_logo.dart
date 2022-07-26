import 'package:flutter/material.dart';
import 'package:movlix/utils/constants.dart';

class CustomDrawerHeaderLogo extends StatelessWidget {
  const CustomDrawerHeaderLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: kDrawerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.local_movies,
            color: Colors.red,
            size: 36.0,
          ),
          RichText(
            text: const TextSpan(
              text: 'Movlix',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
              children: [
                TextSpan(
                  text: '.',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
