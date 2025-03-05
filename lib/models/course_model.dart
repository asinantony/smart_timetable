class CourseModel {
  String id;
  String name;
  String description;
  String lecturerId;

  CourseModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.lecturerId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'lecturerId': lecturerId,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CourseModel(
      id: documentId,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      lecturerId: map['lecturerId'] ?? '',
    );
  }
}
