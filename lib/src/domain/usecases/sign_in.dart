import '../repository/repository.dart';

class SignIn {
  SignIn(this.repository);

  final RepositoryInterface repository;

  Future<String> call({required String email, required String password}) async {
    try {
      return await repository.signIn(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
