import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Timetable")),
      body: FutureBuilder(
        future: _authService.getCurrentUser(),
        builder: (context, AsyncSnapshot userSnapshot) {
          if (!userSnapshot.hasData)
            return Center(child: CircularProgressIndicator());

          String? userId = userSnapshot.data?.uid;
          if (userId == null) return Center(child: Text("User not found"));

          return FutureBuilder(
            future: _firestoreService.fetchTimetable(userId),
            builder:
                (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              List<Map<String, dynamic>> timetable = snapshot.data ?? [];

              return ListView.builder(
                itemCount: timetable.length,
                itemBuilder: (context, index) {
                  var item = timetable[index];
                  return ListTile(
                    title: Text("${item['day']} - ${item['time']}"),
                    subtitle: Text(
                        "Course: ${item['courseId']}, Class: ${item['classId']}"),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
