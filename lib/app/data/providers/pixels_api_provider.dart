import 'package:dio/dio.dart';

class PexelsApiProvider {
  final Dio _dio = Dio();

  final String _baseUrl = "https://api.pexels.com/v1";
  final String _apiKey =
      "5zkdAgFjC5eilf0jTBKzU4APlwNRaHoeNqM7z7Bn5Cx0zPbANsX6mS1D";

  PexelsApiProvider() {
    _dio.options.headers['Authorization'] = _apiKey;
  }

  Future<List<dynamic>> fetchImages(
      {required String query, int page = 1, int perPage = 20}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/search',
        queryParameters: {
          'query': query,
          'page': page,
          'per_page': perPage,
        },
      );

      if (response.statusCode == 200) {
        return response.data['photos'];
      } else {
        throw Exception("Failed to fetch images: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
