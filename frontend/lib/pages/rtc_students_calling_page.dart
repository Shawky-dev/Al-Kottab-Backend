import 'package:flutter/material.dart';
import 'package:frontend/services/student/rtc_student_service.dart';
import 'package:frontend/widgets/rtc_studentcard_widget.dart';
import 'package:frontend/models/rtc_student_model.dart';
import 'package:frontend/services/authServices.dart';
import 'package:frontend/services/webrtc_service.dart';

class StudentsPage extends StatelessWidget {
  final StudentService _studentService = StudentService();
  final AuthServices _authServices = AuthServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
      ),
      body: StreamBuilder<List<Student>>(
        stream: _studentService.getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No students found.'));
          }
          //the below line extracts the list of student objects from the snapshot.
          //the ! is for non-null assertion. Meaning, this is like asking the compiler 
          //if it's certain that snapshot.data is not null.
          final students = snapshot.data!; 
          return ListView.builder(
            itemCount: students.length,
            //context parameter is used to provide info about the location of 
            //widget being built in the widget tree. It can also be used for
            // accessing theme data and navigating to other screens.
            itemBuilder: (context, index) {
              final student = students[index];
              return StudentCard(
                firstName: student.firstName,
                lastName: student.lastName,
                onCallPressed: () {
                  final calleruid = _authServices.getCurrentUserUid();
                  final calleeuid = student.id;
                  final webRTCService = WebRTCService(callerUid: calleruid!, calleeUid: calleeuid);
                  webRTCService.createOffer();
                  //create call handler class to handle setting up listener for offer and sending answer.
                  print('Calling ${student.firstName} ${student.lastName}');
                },
              );
            },
          );
        },
      ),
    );
  }
}