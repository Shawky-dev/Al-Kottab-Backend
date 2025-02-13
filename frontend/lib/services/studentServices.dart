import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frontend/services/student.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StudentResponse> getStudentFromUid(String uid) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/api/student/getStudent/$uid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return StudentResponse.fromJson(
        jsonDecode(response.body), response.statusCode);
  }

  // Get the current logged-in user's data from Firestore
  Future<Student?> getCurrentStudent() async {
    try {
      // Get the current user
      User? user = _auth.currentUser;

      if (user != null) {
        // Fetched the student document from Firestore using the user's UID

        // DocumentSnapshot studentDoc =
        //     await _firestore.collection('students').doc(user.uid).get();
        StudentResponse studentResponse = await getStudentFromUid(user.uid);

        if (studentResponse.student != null) {
          // Convert the Firestore document to a Student object
          return Student.fromFirebaseMapToArabic(
            studentResponse.student as Map<String, dynamic>,
            uid: user.uid, // Pass the uid explicitly
          );
        } else if (studentResponse.statusCode == 404) {
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

  Future<StudentSnackBar> editStudent(Student student) async {
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
        return StudentSnackBar(
            success: true, message: 'Student data updated successfully');
      } else {
        print('User is not logged in or UID does not match');
        return StudentSnackBar(
            success: false,
            message: 'User is not logged in or UID does not match');
      }
    } catch (e) {
      print('Error updating student data: $e');
      return StudentSnackBar(
          success: false, message: 'Error updating student data: $e');
    }
  }
}

class StudentResponse {
  final int statusCode;
  final String message;
  final String? details;
  final Map<String, dynamic>? student;
  final List<Map<String, dynamic>>? studentList;

  StudentResponse({
    required this.statusCode,
    required this.message,
    this.details,
    this.student,
    this.studentList,
  });
  factory StudentResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    return StudentResponse(
      statusCode: statusCode,
      message: json['message'],
      details: json['details'],
      student: json['student'],
      studentList: json['studentList'],
    );
  }
}

class StudentSnackBar {
  final bool success;
  final String message;

  StudentSnackBar({required this.success, required this.message});
}
