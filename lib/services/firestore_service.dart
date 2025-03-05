import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> userData, String userId) async {
    await _db.collection('users').doc(userId).set(userData);
  }

  Future<DocumentSnapshot> getUser(String userId) async {
    return await _db.collection('users').doc(userId).get();
  }

  Future<void> addClass(Map<String, dynamic> classData, String classId) async {
    await _db.collection('classes').doc(classId).set(classData);
  }

  Future<void> addCourse(
      Map<String, dynamic> courseData, String courseId) async {
    await _db.collection('courses').doc(courseId).set(courseData);
  }

  Future<void> addTimetable(
      Map<String, dynamic> timetableData, String timetableId) async {
    await _db.collection('timetables').doc(timetableId).set(timetableData);
  }
}
