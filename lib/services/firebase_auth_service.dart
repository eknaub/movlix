import 'package:firebase_auth/firebase_auth.dart';
import 'package:movlix/models/my_app_user.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  MyAppUser? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return MyAppUser(
      uid: user.uid,
      email: user.email,
    );
  }

  Stream<MyAppUser?> get user {
    return _firebaseAuth.userChanges().map(_userFromFirebase);
  }

  Future<MyAppUser?> signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(userCredential.user);
  }

  Future<MyAppUser?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(userCredential.user);
  }

  Future<MyAppUser?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCredential.user);
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<MyAppUser?> currentUser() async {
    return _userFromFirebase(_firebaseAuth.currentUser);
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
