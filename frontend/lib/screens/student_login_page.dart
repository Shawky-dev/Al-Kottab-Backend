import 'package:flutter/material.dart';
import '../pages/login_form.dart';

class StudentLoginPage extends StatelessWidget {
  const StudentLoginPage({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول للطلاب'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: LoginForm(role: role),
        ),
      ),
    );
  }
}

