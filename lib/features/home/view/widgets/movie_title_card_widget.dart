import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/movie_card_widget.dart';
import 'package:movie_app/features/home/view/widgets/movie_title_widget.dart';
import 'package:movie_app/features/home/viewmodel/movie_viewmodel.dart';

class MovieTitleCardWidget extends StatelessWidget {
  const MovieTitleCardWidget({
    super.key,
    required this.title,
    required this.movieViewmodel,
  });
  final String title;
  final MovieViewmodel movieViewmodel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieTitleWidget(title: title),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final movie = movieViewmodel.movies[index];
              return MovieCardWidget(image: movie.posterPath);
            },
            separatorBuilder: (ctx, index) => SizedBox(width: 10),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
