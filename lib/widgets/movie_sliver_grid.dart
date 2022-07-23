import 'package:flutter/material.dart';

class MovieSliverGrid extends StatelessWidget {
  const MovieSliverGrid({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Widget> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController(),
      shrinkWrap: true,
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500.0,
            mainAxisExtent: 250.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return data[index];
            },
            childCount: data.length,
          ),
        ),
      ],
    );
  }
}
