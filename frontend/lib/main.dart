import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/rtc_students_Avlbl_For_calling.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List',
      home: StudentsPage(),
    );
  }
}