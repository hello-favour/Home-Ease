class UserModel {
  final String id;
  final String email;
  final String name;
  final String profileImage;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
    );
  }
}
