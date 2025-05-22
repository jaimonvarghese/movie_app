import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/features/home/models/movie_model.dart';

class MovieService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _dio.get(
        '/movie/${ApiConstants.popularMoviesEndpoint}',
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      log("Dio error: $e");
      throw Exception("Error fetching popular movies: $e");
    }
  }

  Future<List<MovieModel>> getUpComingMovies() async {
    try {
      final response = await _dio.get(
        '/movie/${ApiConstants.upComingEndPoint}',
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      log("Dio error: $e");
      throw Exception("Error fetching Upcoming movies: $e");
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await _dio.get(
        '/movie/${ApiConstants.topRatedEndpoint}',
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      log("Dio error: $e");
      throw Exception("Error fetching Top Rated  movies: $e");
    }
  }
}
