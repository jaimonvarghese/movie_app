import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/features/home/models/movie_model.dart';

class SearchMovieService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  // Get Trending Movies (Idle List)
  Future<List<MovieModel>> getSearchIdleMovies() async {
    try {
      final response = await _dio.get(
        '/trending/movie/day',
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException catch (dioError) {
      final errorMessage = _handleDioError(
        dioError,
        'fetching trending movies',
      );
      log("Dio error [getSearchIdleMovies]: $errorMessage");
      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected error [getSearchIdleMovies]: $e");
      throw Exception("Unexpected error occurred: $e");
    }
  }

  // Search Movies
  Future<List<MovieModel>> getSearchResultMovies(String query) async {
    try {
      final response = await _dio.get(
        '/search/movie',
        queryParameters: {'query': query, 'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException catch (dioError) {
      final errorMessage = _handleDioError(dioError, 'searching movies');
      log("Dio error [getSearchResultMovies]: $errorMessage");
      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected error [getSearchResultMovies]: $e");
      throw Exception("Unexpected error occurred: $e");
    }
  }

  // Dio Error Handler
  String _handleDioError(DioException dioError, String context) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "Connection timed out while $context. Please check your internet connection.";
      case DioExceptionType.badResponse:
        return "Server responded with error ${dioError.response?.statusCode} while $context.";
      case DioExceptionType.cancel:
        return "Request was cancelled while $context.";
      case DioExceptionType.unknown:
        if (dioError.message?.contains('Connection reset by peer') ?? false) {
          return "Server closed the connection unexpectedly while $context.";
        }
        return "An unknown network error occurred while $context.";
      default:
        return "Unexpected Dio error occurred while $context: ${dioError.message}";
    }
  }
}
