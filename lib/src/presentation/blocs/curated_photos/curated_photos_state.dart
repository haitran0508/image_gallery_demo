import 'package:equatable/equatable.dart';

import '../../../domain/entities/photo.dart';

abstract class CuratedPhotosState extends Equatable {
  @override
  List<Object> get props => [];
}

class CuratedPhotosLoading extends CuratedPhotosState {}

class CuratedPhotosLoaded extends CuratedPhotosState {
  final List<Photo> photos;

  final bool hasReachEnd;

  CuratedPhotosLoaded({required this.photos, this.hasReachEnd = false});

  @override
  List<Object> get props => [photos];
}

class CuratedPhotosError extends CuratedPhotosState {
  final String message;

  CuratedPhotosError(this.message);

  @override
  List<Object> get props => [message];
}
