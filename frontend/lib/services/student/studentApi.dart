import 'package:http/http.dart' as http;

class StudentApi {
  Future<http.Response> getStudentFromUid(String uid) {
    return http.get(
      Uri.parse('http://10.0.2.2:8080/api/student/getStudent/$uid'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
