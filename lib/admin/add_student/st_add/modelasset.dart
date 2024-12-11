class StudentModel {
  int? id;
  final String name;
  final String mail;
  final String gender;
  final String password;
  StudentModel(
      {required this.name,
      required this.mail,
      required this.gender,
      required this.password,
      this.id});
  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['mail'] as String;
    final gender = map['gender'] as String;
    final password = map['password'] as String;
    return StudentModel(
        id: id, name: name, mail: age, gender: gender, password: password);
  }
}
