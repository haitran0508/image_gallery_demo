import 'package:flutter/material.dart';

class InteractiveImage extends StatelessWidget {
  final String smallSrc;
  final String largeSrc;
  final String photoGrahper;
  final String title;

  const InteractiveImage({
    Key? key,
    required this.smallSrc,
    required this.largeSrc,
    required this.photoGrahper,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (context, primaryAnimation, secondaryAnimation) {
            return _PhotoFullView(
              src: largeSrc,
              photoGrahper: photoGrahper,
              title: title,
            );
          },
        );
      },
      child: InteractiveViewer(
        child: Image.network(
          smallSrc,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PhotoFullView extends StatefulWidget {
  final String src;
  final String photoGrahper;
  final String title;
  const _PhotoFullView(
      {Key? key,
      required this.src,
      required this.photoGrahper,
      required this.title})
      : super(key: key);

  @override
  State<_PhotoFullView> createState() => __PhotoFullViewState();
}

class __PhotoFullViewState extends State<_PhotoFullView> {
  late final TransformationController controller;

  bool _isShowInfoAndClearButton = false;

  @override
  void initState() {
    controller = TransformationController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: GestureDetector(
          onTap: () => setState(
            () => _isShowInfoAndClearButton = !_isShowInfoAndClearButton,
          ),
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  transformationController: TransformationController(),
                  boundaryMargin: const EdgeInsets.all(double.infinity),
                  clipBehavior: Clip.none,
                  minScale: 1,
                  child: Image.network(
                    widget.src,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              if (_isShowInfoAndClearButton) ...[
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.clear,
                        size: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          widget.photoGrahper,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
