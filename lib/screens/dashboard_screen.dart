import 'package:flutter/material.dart';
import 'admin_dashboard.dart';
import 'lecturer_dashboard.dart';
import 'login_screen.dart';
import '../services/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkUserRole();
  }

  void _checkUserRole() async {
    String? role = await _authService.getUserRole();
    if (role == "admin") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AdminDashboard()));
    } else if (role == "lecturer") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LecturerDashboard()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
