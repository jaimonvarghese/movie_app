import 'package:flutter/material.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:movie_app/features/home/services/movie_service.dart';

class MovieViewmodel extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<MovieModel> _popularMovies = [];
  List<MovieModel> get popularMovies => _popularMovies;

  List<MovieModel> _upcomingMovies = [];
  List<MovieModel> get upcomingMovies => _upcomingMovies;

  List<MovieModel> _topRatedMovies = [];
  List<MovieModel> get topRatedMovies => _topRatedMovies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  bool _isInitialized = false;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String value) {
    _error = value;
    notifyListeners();
  }

  void _setMovies({
    required List<MovieModel> popular,
    required List<MovieModel> upcoming,
    required List<MovieModel> topRated,
  }) {
    _popularMovies = popular;
    _upcomingMovies = upcoming;
    _topRatedMovies = topRated;
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    if (_isInitialized) return;

    _setLoading(true);
    _setError('');

    try {
      final results = await Future.wait([
        _service.getPopularMovies(),
        _service.getUpComingMovies(),
        _service.getTopRatedMovies(),
      ]);

      _setMovies(
        popular: results[0],
        upcoming: results[1],
        topRated: results[2],
      );
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  /// Call this to refresh movies manually
  Future<void> refreshMovies() async {
    _isInitialized = false;
    await fetchMovies();
  }
}
