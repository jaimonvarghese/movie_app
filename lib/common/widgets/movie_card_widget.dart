import 'package:flutter/material.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:movie_app/features/home/view/screens/movie_detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.image, required this.movie});

  final String image;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final imageUrl = '${ApiConstants.imageBaseUrl}$image';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
        );
      },
      child: Container(
        width: 162,
        height: 216,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
            );
          },
        ),
      ),
    );
  }
}
