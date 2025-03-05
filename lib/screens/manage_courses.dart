import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageCoursesScreen extends StatelessWidget {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addCourse() {
    _db.collection("courses").add({
      "name": nameController.text,
      "description": descriptionController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Courses")),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Course Name")),
          TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description")),
          ElevatedButton(onPressed: addCourse, child: Text("Add Course")),
          Expanded(
            child: StreamBuilder(
              stream: _db.collection("courses").snapshots(),
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
