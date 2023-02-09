import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_demo/src/data/services/network_services.dart/authentication_service.dart';

import '../../src/data/repositories/repository.dart';
import '../../src/data/services/network_services.dart/network_curated_photos_service.dart';
import '../../src/domain/usecases/get_curated_photos.dart';
import '../../src/domain/usecases/sign_in.dart';
import '../../src/domain/usecases/sign_out.dart';
import '../../src/domain/usecases/sign_up.dart';
import '../../src/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import '../../src/presentation/blocs/curated_photos/curated_photo_bloc.dart';

class DependenciesConfigurator {
  static void configDependencies() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<http.Client>(() => http.Client());

    getIt.registerLazySingleton<NetworkCuratedPhotosService>(() {
      final client = getIt.get<http.Client>();
      return NetworkCuratedPhotosService(client);
    });

    getIt.registerLazySingleton<AuthenticationService>(() {
      return AuthenticationService();
    });

    getIt.registerLazySingleton<Repository>(() {
      final curatedService = getIt.get<NetworkCuratedPhotosService>();
      final authService = getIt.get<AuthenticationService>();
      return Repository(
        authService: authService,
        curatedPhotosService: curatedService,
      );
    });

    getIt.registerLazySingleton<GetCuratedPhotos>(() {
      final repository = getIt.get<Repository>();
      return GetCuratedPhotos(repository);
    });

    getIt.registerLazySingleton<CuratedPhotosBloc>(() {
      final getCuratedPhotos = getIt.get<GetCuratedPhotos>();
      return CuratedPhotosBloc(getCuratedPhotos: getCuratedPhotos);
    });

    getIt.registerLazySingleton<SignIn>(() {
      final repository = getIt.get<Repository>();
      return SignIn(repository);
    });

    getIt.registerLazySingleton<SignUp>(() {
      final repository = getIt.get<Repository>();
      return SignUp(repository);
    });

    getIt.registerLazySingleton<SignOut>(() {
      final repository = getIt.get<Repository>();
      return SignOut(repository);
    });

    getIt.registerLazySingleton<AuthenticationBloc>(() {
      final signInUsecase = getIt.get<SignIn>();
      final signUpUsecase = getIt.get<SignUp>();
      final signOutUsecase = getIt.get<SignOut>();
      return AuthenticationBloc(
        signInUsecase: signInUsecase,
        signOutUsecase: signOutUsecase,
        signUpUsecase: signUpUsecase,
      );
    });
  }
}
