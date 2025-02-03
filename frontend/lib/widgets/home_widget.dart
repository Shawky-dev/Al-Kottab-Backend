import 'package:flutter/material.dart';
import 'package:frontend/services/student.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, Student? student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page1',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
