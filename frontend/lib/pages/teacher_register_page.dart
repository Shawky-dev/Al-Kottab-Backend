import 'package:flutter/material.dart';

class TeacherRegisterPage extends StatelessWidget {
  const TeacherRegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل حساب معلم جديد'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Teacher Registration Fields here'),
      ),
    );
  }
}
