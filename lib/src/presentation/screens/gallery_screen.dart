import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../blocs/authentication_bloc/authentication_bloc.dart';
import '../../../shared/string_constant.dart';
import '../blocs/curated_photos/curated_photos_event.dart';
import '../blocs/curated_photos/curated_photos_state.dart';

import '../blocs/curated_photos/curated_photo_bloc.dart';
import '../widgets/interactive_image.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final _curatedPhotosBloc = GetIt.instance.get<CuratedPhotosBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _curatedPhotosBloc.add(
      CuratedPhotosRequested(),
    );
    _scrollController.addListener(_onLastPhotoReached);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _onLastPhotoReached() {
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll == maxScrollExtent) {
      _curatedPhotosBloc.add(CuratedPhotosRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 1.0;
    const photoPerRow = 3;
    const photoViewRatio = 3 / 2;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              final authenBloc = GetIt.instance.get<AuthenticationBloc>();
              authenBloc.signOut();
              Navigator.pop(context);
            },
          ),
          title: const Text(StringConstants.appName)),
      body: SafeArea(
        child: BlocBuilder<CuratedPhotosBloc, CuratedPhotosState>(
          bloc: _curatedPhotosBloc,
          builder: (context, state) {
            if (state is CuratedPhotosLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CuratedPhotosError) {
              return Center(child: Text(state.message));
            }

            state as CuratedPhotosLoaded;

            return GridView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: spacing),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                crossAxisCount: photoPerRow,
                childAspectRatio: 1 / photoViewRatio,
              ),
              itemCount: state.hasReachEnd
                  ? state.photos.length
                  : state.photos.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.photos.length) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  );
                }

                final currentPhoto = state.photos[index];
                return InteractiveImage(
                  smallSrc: currentPhoto.smallSizeUrl,
                  largeSrc: currentPhoto.fullSizeUrl,
                  photoGrahper: currentPhoto.photographer!,
                  title: currentPhoto.alt!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
