import 'package:flutter/material.dart';
import 'package:movie_app/features/home/view/widgets/movie_title_widget.dart';

class MovieTitleCardWidget extends StatelessWidget {
  const MovieTitleCardWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [MovieTitleWidget(title: title), SizedBox(height: 10)],
    );
  }
}
