import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/photo.dart';
import '../../../domain/usecases/get_curated_photos.dart';
import 'curated_photos_event.dart';
import 'curated_photos_state.dart';

class CuratedPhotosBloc extends Bloc<CuratedPhotosEvent, CuratedPhotosState> {
  final GetCuratedPhotos getCuratedPhotos;

  final int _photoPerPage = 27;

  late List<Photo> _photos;
  late int _startPage;

  CuratedPhotosBloc({
    required this.getCuratedPhotos,
  }) : super(CuratedPhotosLoading()) {
    _photos = [];
    _startPage = 0;

    on<CuratedPhotosRequested>((event, emit) async {
      try {
        _startPage += 1;
        final photosResult = await getCuratedPhotos(
          page: _startPage,
          perPage: _photoPerPage,
        );

        _photos += photosResult;

        if (photosResult.length < _photoPerPage) {
          emit(CuratedPhotosLoaded(photos: _photos, hasReachEnd: true));
        } else {
          emit(CuratedPhotosLoaded(photos: _photos, hasReachEnd: false));
        }
      } catch (e) {
        emit(CuratedPhotosError(e.toString()));
      }
    });
  }
}
