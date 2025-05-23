import 'package:flutter/material.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:movie_app/features/search/services/search_movie_service.dart';

class SearchViewmodel extends ChangeNotifier {
  final SearchMovieService _service = SearchMovieService();

  // --- State variables ---
  List<MovieModel> _searchIdleList = [];
  List<MovieModel> get searchIdleList => _searchIdleList;

  List<MovieModel> _searchResults = [];
  List<MovieModel> get searchResults => _searchResults;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  bool _isInitialized = false;

  // --- Private Setters ---
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _error = message;
    notifyListeners();
  }

  void _clearError() {
    if (_error.isNotEmpty) {
      _error = '';
      notifyListeners();
    }
  }

  void _setIdleMovies(List<MovieModel> movies) {
    _searchIdleList = movies;
    notifyListeners();
  }

  void _setSearchResults(List<MovieModel> results) {
    _searchResults = results;
    notifyListeners();
  }

  // --- Fetch Idle List ---
  Future<void> fetchSearchMovies() async {
    if (_isInitialized) return;

    _setLoading(true);
    _clearError();

    try {
      final movies = await _service.getSearchIdleMovies();
      _setIdleMovies(movies);
      _isInitialized = true;
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // --- Fetch Results for Search Query ---
  Future<void> fetchSearchResultMovies(String query) async {
    _setLoading(true);
    _clearError();

    try {
      final results = await _service.getSearchResultMovies(query);
      _setSearchResults(results);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // --- Clear search results ---
  void clearSearchResults() {
    _searchResults.clear();
    notifyListeners();
  }
}
