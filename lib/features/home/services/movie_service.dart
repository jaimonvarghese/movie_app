import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:movie_app/core/api_constants.dart';
import 'package:movie_app/features/home/models/movie_model.dart';

class MovieService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _dio.get(
        '/movie/${ApiConstants.popularMoviesEndpoint}',
        queryParameters: {'api_key': ApiConstants.apiKey},
      );

      final List<dynamic> results = response.data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } on DioException catch (dioError) {
      String errorMessage = 'An unknown error occurred';

      if (dioError.type == DioExceptionType.connectionError ||
          dioError.type == DioExceptionType.receiveTimeout ||
          dioError.type == DioExceptionType.sendTimeout) {
        errorMessage =
            'Connection error: Please check your internet connection.';
      } else if (dioError.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}';
      } else if (dioError.type == DioExceptionType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else if (dioError.type == DioExceptionType.unknown) {
        if (dioError.message?.contains('Connection reset by peer') ?? false) {
          errorMessage =
              'Server closed connection unexpectedly. Please try again.';
        }
      }

      log("Dio error [popular movies]: $errorMessage");
      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected error [popular movies]: $e");
      throw Exception("Unexpected error occurred: $e");
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
    } on DioException catch (dioError) {
      String errorMessage = 'An unknown error occurred';

      if (dioError.type == DioExceptionType.connectionError ||
          dioError.type == DioExceptionType.receiveTimeout ||
          dioError.type == DioExceptionType.sendTimeout) {
        errorMessage =
            'Connection error: Please check your internet connection.';
      } else if (dioError.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}';
      } else if (dioError.type == DioExceptionType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else if (dioError.type == DioExceptionType.unknown) {
        if (dioError.message?.contains('Connection reset by peer') ?? false) {
          errorMessage =
              'Server closed connection unexpectedly. Please try again.';
        }
      }

      log("Dio error [upcoming movies]: $errorMessage");
      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected error [upcoming movies]: $e");
      throw Exception("Unexpected error occurred: $e");
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
    } on DioException catch (dioError) {
      String errorMessage = 'An unknown error occurred';

      if (dioError.type == DioExceptionType.connectionError ||
          dioError.type == DioExceptionType.receiveTimeout ||
          dioError.type == DioExceptionType.sendTimeout) {
        errorMessage =
            'Connection error: Please check your internet connection.';
      } else if (dioError.type == DioExceptionType.badResponse) {
        errorMessage =
            'Server error: ${dioError.response?.statusCode} - ${dioError.response?.statusMessage}';
      } else if (dioError.type == DioExceptionType.cancel) {
        errorMessage = 'Request to server was cancelled.';
      } else if (dioError.type == DioExceptionType.unknown) {
        if (dioError.message?.contains('Connection reset by peer') ?? false) {
          errorMessage =
              'Server closed connection unexpectedly. Please try again.';
        }
      }

      log("Dio error [toprated movies]: $errorMessage");
      throw Exception(errorMessage);
    } catch (e) {
      log("Unexpected error [toprated movies]: $e");
      throw Exception("Unexpected error occurred: $e");
    }
  }
}
