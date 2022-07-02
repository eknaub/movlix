import 'package:flutter/material.dart';

class CenteredContainer extends StatelessWidget {
  const CenteredContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: const Color(0xFF0C0B10).withOpacity(0.9),
        ),
        height: 600,
        width: 600,
        child: child,
      ),
    );
  }
}
