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


  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
     if (_isInitialized) return;
    _setLoading(true);
    _error = "";

    try {
      _popularMovies = await _service.getPopularMovies();
      _upcomingMovies = await _service.getUpComingMovies();
      _topRatedMovies = await _service.getTopRatedMovies();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
