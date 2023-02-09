import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/auth_code.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return FirebaseCode.loginSuccess.code;
    } on FirebaseAuthException catch (exception) {
      return exception.code;
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return FirebaseCode.signUpSuccess.code;
    } on FirebaseAuthException catch (exception) {
      return exception.code;
    }
  }

  Future<String> signOut() async {
    try {
      await _auth.signOut();
      return FirebaseCode.resetPasswordRequested.code;
    } on FirebaseAuthException catch (exception) {
      return exception.code;
    }
  }
}
