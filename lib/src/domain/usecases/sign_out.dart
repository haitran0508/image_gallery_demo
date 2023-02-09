import '../repository/repository.dart';

class SignOut {
  SignOut(this.repository);

  final RepositoryInterface repository;

  Future<String> call() async {
    try {
      return await repository.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
