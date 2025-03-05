import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class GenerateTimetableScreen extends StatefulWidget {
  @override
  _GenerateTimetableState createState() => _GenerateTimetableState();
}

class _GenerateTimetableState extends State<GenerateTimetableScreen> {
  // ✅ Fixed here
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> _courses = [];
  List<Map<String, dynamic>> _lecturers = [];
  List<Map<String, dynamic>> _classes = [];
  List<String> _days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  List<String> _times = [
    "9:00 AM - 10:00 AM",
    "10:00 AM - 11:00 AM",
    "11:00 AM - 12:00 PM"
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var coursesSnapshot = await _db.collection("courses").get();
    var lecturersSnapshot = await _db.collection("lecturers").get();
    var classesSnapshot = await _db.collection("classes").get();

    setState(() {
      _courses = coursesSnapshot.docs
          .map((doc) => {...doc.data(), "id": doc.id})
          .toList();
      _lecturers = lecturersSnapshot.docs
          .map((doc) => {...doc.data(), "id": doc.id})
          .toList();
      _classes = classesSnapshot.docs
          .map((doc) => {...doc.data(), "id": doc.id})
          .toList();
    });
  }

  void generateTimetable() async {
    List<Map<String, dynamic>> timetable = [];
    Random random = Random();

    for (var course in _courses) {
      if (_lecturers.isEmpty || _classes.isEmpty) continue;

      var lecturer = _lecturers[random.nextInt(_lecturers.length)];
      var classItem = _classes[random.nextInt(_classes.length)];
      var day = _days[random.nextInt(_days.length)];
      var time = _times[random.nextInt(_times.length)];

      timetable.add({
        "courseId": course["id"],
        "lecturerId": lecturer["id"],
        "classId": classItem["id"],
        "day": day,
        "time": time,
      });
    }

    for (var entry in timetable) {
      await _db.collection("timetables").add(entry);
    }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Timetable generated successfully!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate Timetable")),
      body: Center(
        child: ElevatedButton(
          onPressed: generateTimetable,
          child: Text("Generate Timetable"),
        ),
      ),
    );
  }
}
