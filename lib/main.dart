import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'cores/dependencies_config/dependencies_config.dart';
import 'src/photo_gallery_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DependenciesConfigurator.configDependencies();

  runApp(const PhotoGalleryDemo());
}
