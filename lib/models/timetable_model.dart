class TimetableModel {
  String id;
  String classId;
  String courseId;
  String lecturerId;
  String day;
  String time;

  TimetableModel(
      {required this.id,
      required this.classId,
      required this.courseId,
      required this.lecturerId,
      required this.day,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'classId': classId,
      'courseId': courseId,
      'lecturerId': lecturerId,
      'day': day,
      'time': time,
    };
  }

  factory TimetableModel.fromMap(Map<String, dynamic> map, String documentId) {
    return TimetableModel(
      id: documentId,
      classId: map['classId'] ?? '',
      courseId: map['courseId'] ?? '',
      lecturerId: map['lecturerId'] ?? '',
      day: map['day'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
