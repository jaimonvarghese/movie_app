import 'package:flutter/material.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:movie_app/features/search/services/search_movie_service.dart';

class SearchViewmodel extends ChangeNotifier {
  final SearchMovieService _service = SearchMovieService();

  List<MovieModel> _searchIdleList = [];
  List<MovieModel> get searchIdleList => _searchIdleList;

  List<MovieModel> _searchResults = [];
  List<MovieModel> get searchResults => _searchResults;

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

  Future<void> fetchSearchMovies() async {
    if (_isInitialized) return;
    _setLoading(true);
    _error = "";

    try {
      _searchIdleList = await _service.getSearchIdleMovies();
      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchSearchResultMovies(String query) async {
  _setLoading(true);
  _error = "";

  try {
    _searchResults = await _service.getSearchResultMovies(query);
    notifyListeners();
  } catch (e) {
    _setError(e.toString());
  } finally {
    _setLoading(false);
  }
}


}
