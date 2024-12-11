class SubjectSetModelBiology {
  int? id;
  final String subjectname;
  final String subjectphone;
  final String subjectnew;
  SubjectSetModelBiology(
      {required this.subjectname,
      required this.subjectphone,
      required this.subjectnew,
      this.id});
  static SubjectSetModelBiology fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final subjectname = map['subjectname'] as String;
    final subjectphone = map['subjectphone'] as String;
    final subjectnew = map['subjectnew'] as String;
    return SubjectSetModelBiology(
        id: id,
        subjectname: subjectname,
        subjectphone: subjectphone,
        subjectnew: subjectnew);
  }
}
