import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Registers a new user using email and password.
  Future<UserCredential> registerWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('FirebaseAuthException: ${e.code} - ${e.message}');
    } catch (e) {
      throw Exception('Unknown error during sign up: $e');
    }
  }

  /// Signs in an existing user using email and password.
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('FirebaseAuthException: ${e.code} - ${e.message}');
    } catch (e) {
      throw Exception('Unknown error during sign in: $e');
    }
  }



   /// Sends a password reset email to the given email address.
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('FirebaseAuthException: ${e.code} - ${e.message}');
    } catch (e) {
      throw Exception('Failed to send reset password email: $e');
    }
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      // Add other sign-out methods if using Google/Facebook
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  /// Returns the current authenticated user, or null if signed out.
  User? get currentUser => _auth.currentUser;
}
