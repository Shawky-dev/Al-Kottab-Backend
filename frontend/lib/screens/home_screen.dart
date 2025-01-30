import 'package:flutter/material.dart';
import 'teacher_login_page.dart';
import 'student_login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'من أنت',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleBox(context, "معلم", Colors.blue, TeacherLoginPage(role: "teacher")),
                SizedBox(width: 40),
                _buildRoleBox(context, "طالب", Colors.green, StudentLoginPage(role: "student")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleBox(BuildContext context, String label, Color color, Widget page) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
