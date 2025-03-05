import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageLecturersScreen extends StatelessWidget {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void addLecturer() {
    _db.collection("lecturers").add({
      "name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Lecturers")),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Lecturer Name")),
          TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email")),
          TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone")),
          ElevatedButton(onPressed: addLecturer, child: Text("Add Lecturer")),
          Expanded(
            child: StreamBuilder(
              stream: _db.collection("lecturers").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView(
                    children: snapshot.data!.docs
                        .map((doc) => ListTile(title: Text(doc["name"])))
                        .toList());
              },
            ),
          ),
        ],
      ),
    );
  }
}
