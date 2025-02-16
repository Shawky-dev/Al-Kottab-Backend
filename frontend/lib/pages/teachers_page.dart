import 'package:flutter/material.dart';
import '../widgets/teachers_widget.dart';

class Teacher {
  final String name;
  final String imagePath;

  Teacher({required this.name, required this.imagePath});
}

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
_TeachersPageState createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  List<Teacher> teachers = [
  Teacher(name: 'أحمد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'محمد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'علي', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'حسن', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'يوسف', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'عمر', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'محمود', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'خالد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'طارق', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'عمرو', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'حسين', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'سيف', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'فادي', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'رامي', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'زياد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'أحمد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'محمد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'علي', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'حسن', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'يوسف', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'عمر', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'محمود', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'خالد', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'طارق', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'عمرو', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'حسين', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'سيف', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'فادي', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'رامي', imagePath: './assets/img/teacher.png'),
  Teacher(name: 'زياد', imagePath: './assets/img/teacher.png'),
];

  

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {

    List<Teacher> filteredTeachers = teachers
        .where((teacher) =>
            teacher.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'البحث...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: filteredTeachers.length,
                itemBuilder: (context, index) {
                  return TeacherCard(
                    name: filteredTeachers[index].name,
                    imagePath: filteredTeachers[index].imagePath,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
