import 'package:flutter/material.dart';
import 'package:frontend/services/student.dart';

class HomeWidget extends StatelessWidget {
  final Student? student;

  const HomeWidget({Key? key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Home Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (student != null) ...[
            SizedBox(height: 20),
            Text(
              'Welcome, ${student!.firstName} ${student!.lastName}!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
