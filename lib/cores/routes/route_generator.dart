import 'package:flutter/material.dart';
import '../../src/presentation/screens/auth_screen.dart';

import '../../src/presentation/screens/gallery_screen.dart';
import 'route_names.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.authen:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationScreen());
      case RouteNames.gallery:
        return MaterialPageRoute(builder: (context) => const GalleryScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationScreen());
    }
  }
}
