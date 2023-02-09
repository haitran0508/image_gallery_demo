import '../repository/repository.dart';

class SignUp {
  SignUp(this.repository);

  final RepositoryInterface repository;

  Future<String> call({required String email, required String password}) async {
    try {
      return await repository.signUp(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
