// lib/models/user.dart
class User {
  int? id;
  String firstName;
  String email;

  User({this.id, required this.firstName, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
    };
  }
}
