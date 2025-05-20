

import 'dart:convert';

import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/features/home/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  final String baseUrl = ApiConstants.baseUrl;

  Future<List<MovieModel>> getPopularMovies() async {
  final url = Uri.parse(
    'https://api.themoviedb.org/3/movie/popular?api_key=a36c231563a655a2561c7557987454ce',
  );

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Extract the 'results' list
      final List<dynamic> results = data['results'];

      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching movies: $e');
  }
}

}
