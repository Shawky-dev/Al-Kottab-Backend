import 'package:flutter/material.dart';
import 'teacher_register_page.dart';
import 'student_register_page.dart';

class LoginForm extends StatelessWidget {
  final String role;

  const LoginForm({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // Keep the overall layout centered
      children: [
        Text(
          'تسجيل دخول',
          textAlign: TextAlign.center, // Keep text centered
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            textAlign: TextAlign.right, // Align text in the text field to the right
            decoration: InputDecoration(
              labelText: 'الحساب الإلكتروني',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
        SizedBox(height: 20),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            textAlign: TextAlign.right, // Align text in the text field to the right
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'كلمة السر',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Forget password logic make it in an external function w call it bs 
          },
          child: Text(
            'نسيت كلمة السر؟',
            textAlign: TextAlign.right, // Align text to the right
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => role == "teacher" ? TeacherRegisterPage() : StudentRegisterPage(),
              ),
            );
          },
          child: Text(
            'ليس لديك حساب؟ سجل الآن',
            textAlign: TextAlign.right, // Align text to the right
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            // Login logic hayba hena han3mlo fe function tanya w n callha
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
