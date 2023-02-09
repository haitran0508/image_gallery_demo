import '../entities/photo.dart';

abstract class RepositoryInterface {
  Future<List<Photo>> getCuratedPhotos(
      {required int page, required int perPage});

  Future<String> signIn({required String email, required String password});
  Future<String> signUp({required String email, required String password});
  Future<String> signOut();
}
