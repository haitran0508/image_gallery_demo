import 'package:equatable/equatable.dart';

import 'photo_src.dart';

class PhotoModel extends Equatable {
  final int id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final int? photographerId;
  final String? avgColor;
  final PhotoSrcModel? src;
  final bool? liked;
  final String? alt;
  const PhotoModel(
      {required this.id,
      this.width,
      this.height,
      this.url,
      this.photographer,
      this.photographerUrl,
      this.photographerId,
      this.avgColor,
      this.src,
      this.liked,
      this.alt});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        photographer: json['photographer'],
        photographerUrl: json['photographer_url'],
        photographerId: json['photographer_id'],
        avgColor: json['avg_color'],
        src: json['src'] != null ? PhotoSrcModel.fromJson(json['src']) : null,
        liked: json['liked'],
        alt: json['alt']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    data['photographer'] = photographer;
    data['photographer_url'] = photographerUrl;
    data['photographer_id'] = photographerId;
    data['avg_color'] = avgColor;
    if (src != null) {
      data['src'] = toJson();
    }
    data['liked'] = liked;
    data['alt'] = alt;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        width,
        height,
        url,
        photographer,
        photographerUrl,
        photographerId,
        avgColor,
        src,
        liked,
        alt
      ];
}
