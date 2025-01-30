import 'package:flutter/material.dart';

class StudentRegisterPage extends StatelessWidget {
  const StudentRegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل حساب طالب جديد'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Student Registration Fields here'),
      ),
    );
  }
}
