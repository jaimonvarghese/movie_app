import 'package:flutter/material.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:movie_app/features/home/services/movie_service.dart';

class MovieViewmodel extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<MovieModel> _movies = [];

  bool _isLoading = false;
  String _error = '';

  List<MovieModel> get movies => _movies;
  bool get isLoading => _isLoading;
  String get error => _error;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  //fetch popular movies list

  Future<void> fetchPopularMovies() async {
    _setLoading(true);
    _error = '';

    try {
      _movies = await _service.getPopularMovies();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}
