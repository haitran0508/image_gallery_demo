import '../entities/photo.dart';
import '../repository/repository.dart';

class GetCuratedPhotos {
  GetCuratedPhotos(this.repository);

  final RepositoryInterface repository;

  Future<List<Photo>> call({required int page, required int perPage}) async {
    try {
      return await repository.getCuratedPhotos(page: page, perPage: perPage);
    } catch (e) {
      rethrow;
    }
  }
}
