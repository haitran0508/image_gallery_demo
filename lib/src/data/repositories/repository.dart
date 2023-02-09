import '../../domain/entities/photo.dart';
import '../services/network_services.dart/authentication_service.dart';
import '../../domain/repository/repository.dart';
import '../services/network_services.dart/network_curated_photos_service.dart';
import 'mappers/photo_mapper.dart';

class Repository extends RepositoryInterface {
  final NetworkCuratedPhotosService curatedPhotosService;
  final AuthenticationService authService;

  Repository({
    required this.curatedPhotosService,
    required this.authService,
  });

  @override
  Future<List<Photo>> getCuratedPhotos(
      {required int page, required int perPage}) async {
    try {
      final photosMapper = PhotoMapper();
      final curatedPhotosModel = await curatedPhotosService.getCuratedPhotos(
          page: page, perPage: perPage);

      final photos = curatedPhotosModel.photos
          .map((item) => photosMapper.mapToEntity(item))
          .toList();

      return photos;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    final code = await authService.signIn(email, password);
    return code;
  }

  @override
  Future<String> signUp(
      {required String email, required String password}) async {
    final code = await authService.signUp(email, password);
    return code;
  }

  @override
  Future<String> signOut() async {
    final code = await authService.signOut();
    return code;
  }
}
