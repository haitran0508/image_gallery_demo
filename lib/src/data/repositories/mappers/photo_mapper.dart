import '../../../domain/entities/photo.dart';
import '../../../domain/entities/photo_src.dart';
import '../../models/photo.dart';
import '../mapper.dart';
import 'photo_src_mapper.dart';

class PhotoMapper implements Mapper<PhotoModel, Photo> {
  @override
  mapToEntity(model) {
    PhotoSrc? photoSrc;

    if (model.src != null) {
      final photoSrcMapper = PhotoSrcMapper();
      photoSrc = photoSrcMapper.mapToEntity(model.src!);
    }
    return Photo(
      id: model.id,
      smallSizeUrl: model.src!.medium!,
      fullSizeUrl: model.src!.original!,
      photographer: model.photographer,
      alt: model.alt,
    );
  }
}
