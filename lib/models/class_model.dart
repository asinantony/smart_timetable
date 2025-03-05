class ClassModel {
  String id;
  String name;
  String description;

  ClassModel({required this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ClassModel(
      id: documentId,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
