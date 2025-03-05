import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  String role = "lecturer"; // Default role
  bool isLoading = false; // To show loading indicator

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register(BuildContext context) async {
    setState(() => isLoading = true); // Show loading indicator

    try {
      var user = await _authService.register(
        emailController.text.trim(),
        passwordController.text.trim(),
        nameController.text.trim(),
        role, // Pass selected role
      );

      if (user != null) {
        await _firestoreService.addUser({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "role": role,
        }, user.uid); // Store user data in Firestore

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed. Please try again.")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    setState(() => isLoading = false); // Hide loading indicator
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 10),

            // Dropdown for Role Selection
            DropdownButton<String>(
              value: role,
              onChanged: (newRole) {
                setState(() {
                  role = newRole!;
                });
              },
              items: ["admin", "lecturer"].map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role.toUpperCase()),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Register Button with Loading Indicator
            isLoading
                ? CircularProgressIndicator() // Show loading indicator
                : ElevatedButton(
                    onPressed: () => register(context),
                    child: Text("Register"),
                  ),
          ],
        ),
      ),
    );
  }
}
