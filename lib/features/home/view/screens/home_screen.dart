import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/error_box_container.dart';
import 'package:movie_app/common/widgets/movie_card_widget.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:movie_app/features/home/view/widgets/movie_main_card.dart';
import 'package:movie_app/features/home/view/widgets/movie_title_card_widget.dart';
import 'package:movie_app/features/home/view/widgets/quick_action_section_widget.dart';
import 'package:movie_app/features/home/viewmodel/movie_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MovieViewmodel>(context, listen: false).fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Consumer<MovieViewmodel>(
          builder: (context, movieViewmodel, _) {
            if (movieViewmodel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.redAccent),
              );
            }

            if (movieViewmodel.error.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ErrorBoxContainer(
                  onPressed: () {
                    movieViewmodel.fetchMovies();
                  },
                  error: movieViewmodel.error,
                ),
              );
            }

            if (movieViewmodel.popularMovies.isEmpty ||
                movieViewmodel.upcomingMovies.isEmpty ||
                movieViewmodel.topRatedMovies.isEmpty) {
              return const Center(
                child: Text(
                  'No Data Found',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const QuickActionSectionWidget(),
                const SizedBox(height: 24),
            
                // Hero Card
                MovieMainCard(movieViewmodel: movieViewmodel),
                const SizedBox(height: 24),
            
                // Popular Movies
                const MovieTitleCardWidget(title: ' Popular Movies'),
                const SizedBox(height: 12),
                buildHorizontalMovieList(movieViewmodel.popularMovies),
            
                const SizedBox(height: 28),
            
                // Upcoming Movies
                const MovieTitleCardWidget(title: ' Upcoming Movies'),
                const SizedBox(height: 12),
                buildHorizontalMovieList(movieViewmodel.upcomingMovies),
            
                const SizedBox(height: 28),
            
                // Top Rated Movies
                const MovieTitleCardWidget(title: ' TopRated '),
                const SizedBox(height: 12),
                buildHorizontalMovieList(movieViewmodel.topRatedMovies),
            
                const SizedBox(height: 40),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildHorizontalMovieList(List<MovieModel> movies) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieCardWidget(image: movie.posterPath, movie: movie);
        },
      ),
    );
  }
}
