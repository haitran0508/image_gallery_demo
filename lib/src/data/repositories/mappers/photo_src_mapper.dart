import '../../../domain/entities/photo_src.dart';
import '../../models/photo_src.dart';
import '../mapper.dart';

class PhotoSrcMapper implements Mapper<PhotoSrcModel, PhotoSrc> {
  @override
  mapToEntity(model) {
    return PhotoSrc(
      original: model.original,
      large2x: model.large2x,
      large: model.large,
      medium: model.medium,
      small: model.small,
      tiny: model.tiny,
      portrait: model.portrait,
      landscape: model.landscape,
    );
  }
}
