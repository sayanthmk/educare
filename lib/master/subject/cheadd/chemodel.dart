class SubjectSetModelChemistry {
  int? id;
  final String subjectname;
  final String subjectphone;
  final String subjectnew;
  SubjectSetModelChemistry(
      {required this.subjectname,
      required this.subjectphone,
      required this.subjectnew,
      this.id});
  static SubjectSetModelChemistry fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final subjectname = map['subjectname'] as String;
    final subjectphone = map['subjectphone'] as String;
    final subjectnew = map['subjectnew'] as String;
    return SubjectSetModelChemistry(
        id: id,
        subjectname: subjectname,
        subjectphone: subjectphone,
        subjectnew: subjectnew);
  }
}
