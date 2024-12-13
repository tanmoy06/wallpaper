import 'package:wallpaper/app/data/providers/pixels_api_provider.dart';

class ImageRepository {
  final PexelsApiProvider _apiProvider;

  ImageRepository(this._apiProvider);

  Future<List<dynamic>> getImages(String query,
      {int page = 1, int perPage = 20}) {
    return _apiProvider.fetchImages(query: query, page: page, perPage: perPage);
  }
}
