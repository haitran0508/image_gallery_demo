import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/auth_code.dart';
import '../../../domain/usecases/sign_in.dart';
import '../../../domain/usecases/sign_out.dart';
import '../../../domain/usecases/sign_up.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  final SignIn signInUsecase;
  final SignUp signUpUsecase;
  final SignOut signOutUsecase;

  AuthenticationBloc({
    required this.signInUsecase,
    required this.signUpUsecase,
    required this.signOutUsecase,
  }) : super(AuthenticationInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(SignInInProgress());
      final status = await signInUsecase(email: email, password: password);
      if (status == FirebaseCode.loginSuccess.code) {
        emit(SignInSuccess());
      } else {
        emit(SignInFailed(message: status));
      }
    } catch (e) {
      emit(SignInFailed(message: e.toString()));
    }
  }

  void signUp({required String email, required String password}) async {
    try {
      emit(SignUpInProgress());
      final status = await signUpUsecase(email: email, password: password);
      if (status == FirebaseCode.loginSuccess.code) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailed(message: status));
      }
    } catch (e) {
      emit(SignUpFailed(message: e.toString()));
    }
  }

  void signOut() async {
    try {
      final status = await signOutUsecase();
      if (status == FirebaseCode.loginSuccess.code) {
        emit(SignOutSuccess());
      } else {
        emit(SignOutFailed(message: status));
      }
    } catch (e) {
      emit(SignOutFailed(message: e.toString()));
    }
  }
}
