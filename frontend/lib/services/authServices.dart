import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/services/student.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AuthResponse> registerStudent({required Student student}) async {
    if (student.email.isEmpty || student.password!.isEmpty) {
      return AuthResponse(
          success: false, message: "Email and password are required");
    }
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: student.email, password: student.password!);

      await _firestore
          .collection("students")
          .doc(credential.user!.uid)
          .set(student.toFirebaseMap());
      return AuthResponse(
          success: true, message: "Account Registered Successfully!");
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      print(e);
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An unknown error occurred.';
      }
      return AuthResponse(success: false, message: errorMessage);
    } on FirebaseException catch (e) {
      String errorMessage;
      print(e);
      if (e.code == 'permission-denied') {
        errorMessage = 'You do not have permission to perform this action.';
      } else {
        errorMessage = 'An unknown Firestore error occurred.';
      }
      return AuthResponse(success: false, message: errorMessage);
    } catch (e) {
      print(e);
      return AuthResponse(
          success: false, message: 'An unknown error occurred.');
    }
  }

  Future<AuthResponse> loginStudent(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return AuthResponse(
          success: false, message: "Email and password are required");
    }
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return AuthResponse(success: true, message: "Login Successful!");
    } catch (e) {
      return AuthResponse(success: false, message: "failed to login");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthResponse {
  final bool success;
  final String message;

  AuthResponse({required this.success, required this.message});
}
