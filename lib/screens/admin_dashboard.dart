import 'package:flutter/material.dart';
import 'manage_classes.dart';
import 'manage_courses.dart';
import 'manage_lecturers.dart';
import 'generate_timetable.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class AdminDashboard extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDashboardButton(
                context, "Manage Classes", ManageClassesScreen()),
            _buildDashboardButton(
                context, "Manage Courses", ManageCoursesScreen()),
            _buildDashboardButton(
                context, "Manage Lecturers", ManageLecturersScreen()),
            _buildDashboardButton(
                context, "Generate Timetable", GenerateTimetableScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardButton(
      BuildContext context, String title, Widget screen) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(title),
      ),
    );
  }
}
