import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final VoidCallback onCallPressed;

  const StudentCard({
    required this.firstName,
    required this.lastName,
    required this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$firstName $lastName',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onCallPressed,
              child: Text('Call'),
            ),
          ],
        ),
      ),
    );
  }
}