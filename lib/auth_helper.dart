import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Singleton (Optional)
  static final AuthHelper instance = AuthHelper._internal();
  AuthHelper._internal();

  //* LogIn
  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  //* SignUp
  Future<User?> signUp(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print("Signup Error: $e");
      return null;
    }
  }

  //* SignOut
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
