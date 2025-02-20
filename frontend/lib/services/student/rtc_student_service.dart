import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/models/rtc_student_model.dart';

class StudentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//a Stream means that any changes in firestore collection will be reflected.
//This is useful realtime updates. 
  Stream<List<Student>> getStudents() {
    //snapshot is like a screenshot of the students collection at a point in time.
    //snapshots() method sets up a listener for real-time updates.Whenever there is a 
    //change in the students collection, a new snapshot will be emitted,
    //.map((snapshot)...) transforms each snapshot emitted into a List<Student>.
    return _firestore.collection('students').snapshots().map((snapshot) {
      //each doc(student) in the snapshot is passed to the fromMap method
      //that is from the rtc_student_model file.
      return snapshot.docs.map((doc) {
        return Student.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }
}