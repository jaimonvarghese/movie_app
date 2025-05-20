import 'package:flutter/material.dart';
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
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<MovieViewmodel>(
            context,
            listen: false,
          ).fetchPopularMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<MovieViewmodel>(
            builder: (context, movieViewmodel, _) {
              // Loading state
              if (movieViewmodel.isLoading && movieViewmodel.movies.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF50C4ED)),
                );
              }

              // Error state
              if (movieViewmodel.error.isNotEmpty &&
                  movieViewmodel.movies.isEmpty) {
                return _buildErrorView(movieViewmodel);
              }

              // Main content
              return RefreshIndicator(
                onRefresh: () => movieViewmodel.fetchPopularMovies(),
                child: ListView(
                  children: [
                    const QuickActionSectionWidget(),
                    const SizedBox(height: 16),
                    const MovieMainCard(),
                    const SizedBox(height: 16),
                    MovieTitleCardWidget(
                      title: 'Popular Movies',
                      movieViewmodel: movieViewmodel,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildErrorView(MovieViewmodel movieViewmodel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 60),
          const SizedBox(height: 16),
          Text(
            movieViewmodel.error,
            style: const TextStyle(color: Colors.redAccent, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => movieViewmodel.fetchPopularMovies(),
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF50C4ED),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
