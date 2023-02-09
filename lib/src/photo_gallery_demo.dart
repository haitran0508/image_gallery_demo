import 'package:flutter/material.dart';

import '../cores/routes/route_generator.dart';
import '../cores/routes/route_names.dart';
import '../shared/string_constant.dart';

class PhotoGalleryDemo extends StatelessWidget {
  const PhotoGalleryDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      initialRoute: RouteNames.authen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
