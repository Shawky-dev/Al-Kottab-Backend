import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/services/student.dart';

class StudentServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get the current logged-in user's data from Firestore
  Future<Student?> getCurrentStudent() async {
    try {
      // Get the current user
      User? user = _auth.currentUser;

      if (user != null) {
        // Fetchd the student document from Firestore using the user's UID
        DocumentSnapshot studentDoc =
            await _firestore.collection('students').doc(user.uid).get();

        if (studentDoc.exists) {
          // Convert the Firestore document to a Student object
          return Student.fromFirebaseMap(
            studentDoc.data() as Map<String, dynamic>,
            uid: user.uid, // Pass the uid explicitly
          );
        } else {
          print('Student document does not exist');
          return null;
        }
      } else {
        print('No user is currently logged in');
        return null;
      }
    } catch (e) {
      print('Error fetching current student data: $e');
      return null;
    }
  }

  Future<StudentResponse> editStudent(Student student) async {
    try {
      // Get the current user
      User? user = _auth.currentUser;

      if (user != null && user.uid == student.uid) {
        // Convert the Student object to a map
        Map<String, dynamic> studentMap = student.toFirebaseMap();

        // Update the student document in Firestore
        await _firestore
            .collection('students')
            .doc(student.uid)
            .update(studentMap);

        print('Student data updated successfully');
        return StudentResponse(
            success: true, message: 'Student data updated successfully');
      } else {
        print('User is not logged in or UID does not match');
        return StudentResponse(
            success: false,
            message: 'User is not logged in or UID does not match');
      }
    } catch (e) {
      print('Error updating student data: $e');
      return StudentResponse(
          success: false, message: 'Error updating student data: $e');
    }
  }
}

class StudentResponse {
  final bool success;
  final String message;

  StudentResponse({required this.success, required this.message});
}
