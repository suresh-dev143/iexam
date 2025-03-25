import 'package:firebase_auth/firebase_auth.dart';
import 'package:iexam/core/utils/show_snackbar.dart';

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> signUpWithEmainAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use. ');
      } else {
        showToast(message: 'An error occured: ${error.code}');
      }
    }
    return null;
  }

  Future<User?> signinWithEmainAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found' || error.code == 'wrong-password') {
        showToast(message: 'Invalid email or password ');
      } else {
        showToast(message: 'An error occured: ${error.code}');
      }
    }
    return null;
  }
}
