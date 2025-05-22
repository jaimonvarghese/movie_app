import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fetch current user details from FirebaseAuth
  Future<UserModel?> getCurrentUser() async {
    final User? firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      return UserModel(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
        photoUrl: firebaseUser.photoURL ?? '',
      );
    } else {
      return null;
    }
  }
}
