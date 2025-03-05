class UserModel {
  String id;
  String name;
  String email;
  String role;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.role});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? 'lecturer',
    );
  }
}
