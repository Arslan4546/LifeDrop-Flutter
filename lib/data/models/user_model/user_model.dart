class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;
  final String bloodType;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.bloodType,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'bloodType': bloodType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
      bloodType: map['bloodType'],
    );
  }
}
