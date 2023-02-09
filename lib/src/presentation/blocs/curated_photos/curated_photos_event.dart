import 'package:equatable/equatable.dart';

abstract class CuratedPhotosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CuratedPhotosRequested extends CuratedPhotosEvent {
  CuratedPhotosRequested();

  @override
  List<Object> get props => [];
}
