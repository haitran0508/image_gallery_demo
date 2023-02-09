import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/curated_photos.dart.dart';

abstract class NetworkCuratedPhotosServiceInterface {
  // Override this method to get curated photos
  Future<CuratedPhotosModel> getCuratedPhotos(
      {required int page, required int perPage});
}

class NetworkCuratedPhotosService extends NetworkCuratedPhotosServiceInterface {
  final http.Client httpClient;

  NetworkCuratedPhotosService(this.httpClient);

  @override
  Future<CuratedPhotosModel> getCuratedPhotos(
      {required int page, required int perPage}) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'api.pexels.com',
        path: 'v1/curated',
        queryParameters: {'page': '$page', 'per_page': '$perPage'},
      );

      final response = await httpClient.get(uri, headers: {
        'Authorization':
            'TvKeFLJJ5zwObdH9gXiVN2q4qlkhgersLpX4n8IimyDvuXMikgoTZdKg'
      });

      if (response.statusCode == 200) {
        final responseResult = json.decode(response.body);

        final photos = CuratedPhotosModel.fromJson(responseResult);

        return photos;
      } else {
        throw Exception(
            'Failed to load photos. Error Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
