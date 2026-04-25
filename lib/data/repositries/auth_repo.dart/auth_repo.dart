import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:life_drop/core/exceptions/firebase_exceptions/fireabse_exceptions.dart';
import 'package:life_drop/data/models/user_model/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register
  Future<UserModel> registerUser(UserModel user, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      String uid = credential.user!.uid;

      UserModel newUser = UserModel(
        uid: uid,
        name: user.name,
        email: user.email,
        role: user.role,
        bloodType: user.bloodType,
      );

      await _firestore.collection('users').doc(uid).set(newUser.toMap());

      return newUser;
    } on FirebaseAuthException catch (e) {
      throw Exception(FirebaseExceptions.getAuthErrorMessage(e));
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  // Login
  Future<UserModel> loginUser(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    String uid = credential.user!.uid;

    DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();

    return UserModel.fromMap(doc.data() as Map<String, dynamic>);
  }
}
