import 'package:equatable/equatable.dart';

import 'photo.dart';

class CuratedPhotosModel extends Equatable {
  final int page;
  final int perPage;
  final List<PhotoModel> photos;
  final String nextPageUrl;

  const CuratedPhotosModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPageUrl,
  });

  factory CuratedPhotosModel.fromJson(Map<String, dynamic> json) {
    final List<PhotoModel> photos = (json['photos'] as List)
        .map((photoJson) => PhotoModel.fromJson(photoJson))
        .toList();
    return CuratedPhotosModel(
      page: json['page'],
      perPage: json['per_page'],
      photos: photos,
      nextPageUrl: json['next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['photos'] = photos;
    data['next_page'] = nextPageUrl;
    return data;
  }

  @override
  List<Object?> get props => [page, perPage, photos, nextPageUrl];
}
