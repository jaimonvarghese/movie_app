import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/features/home/models/movie_model.dart';

class SearchMovieService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  //search Idle list
  Future<List<MovieModel>> getSearchIdleMovies() async {
    try {
      final response = await _dio.get(
        '/trending/movie/day',
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      log("Dio error: $e");
      throw Exception("Error fetching popular movies: $e");
    }
  }

  //search result of movies

  Future<List<MovieModel>> getSearchResultMovies(String query) async {
    try {
      final response = await _dio.get(
        '/search/movie',
        queryParameters: {
          'api_key':ApiConstants.apiKey ,
          'query': query,
        },
      );
      log(response.toString());
      final List<dynamic> results = response.data['results'];
      log(results.toString());
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      log('Search Error: $e');
      throw Exception('Error searching movies: $e');
    }
  }
}
