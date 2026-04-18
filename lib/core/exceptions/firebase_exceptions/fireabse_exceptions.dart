import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptions {
  static String getAuthErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "This email is already registered";

      case 'invalid-email':
        return "Invalid email format";

      case 'weak-password':
        return "Password should be at least 6 characters";

      case 'user-not-found':
        return "No user found with this email";

      case 'wrong-password':
        return "Incorrect password";

      case 'network-request-failed':
        return "Check your internet connection";

      case 'too-many-requests':
        return "Too many attempts, try again later";

      default:
        return e.message ?? "Something went wrong";
    }
  }
}
