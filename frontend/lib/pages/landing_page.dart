import '../pages/login_page.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
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
                _buildRoleBox(context, "معلم", Colors.black, LoginPage(role: "teacher"), 'assets/img/teacher.png'),
                SizedBox(width: 40),
                _buildRoleBox(context, "طالب", Colors.black, LoginPage(role: "student"), 'assets/img/student.png'),
              ],
            ),
          ],
        ),
      ),
    
    );
  }

  Widget _buildRoleBox(BuildContext context, String label, Color color, Widget page, String imagePath) {
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
            child: Center(
              child: Image.asset(
                imagePath,
                width: 120, // Display width
                height: 120, // Display height
                fit: BoxFit.contain, // Maintain aspect ratio
                cacheWidth: 200, // Render at a lower resolution
                cacheHeight: 200, // Render at a lower resolution
              ),
            ),
          ),
        ),
      ],
    );
  }
}