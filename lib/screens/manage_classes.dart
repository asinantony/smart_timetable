import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManageClassesScreen extends StatelessWidget {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addClass() {
    _db.collection("classes").add({
      "name": nameController.text,
      "description": descriptionController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Classes")),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Class Name")),
          TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description")),
          ElevatedButton(onPressed: addClass, child: Text("Add Class")),
          Expanded(
            child: StreamBuilder(
              stream: _db.collection("classes").snapshots(),
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
