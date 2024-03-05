class StudentModel {
  int? id;
  final String name;
  final String age;
  final String gender;
  StudentModel(
      {required this.name, required this.age, required this.gender, this.id});
  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;
    final gender = map['gender'] as String;
    return StudentModel(id: id, name: name, age: age, gender: gender);
  }
}
