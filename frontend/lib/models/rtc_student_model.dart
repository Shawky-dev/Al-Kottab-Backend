class Student {
  final String id;
  final String firstName;
  final String lastName;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Student.fromMap(Map<String, dynamic> data, String id) {
    return Student(
      id: id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
    );
  }
}