// lib/models/user.dart

class User {
  final String id;
  final String name;
  final String email;
  final String? token; // Optional: For storing the authentication token

  User({
    required this.id,
    required this.name,
    required this.email,
    this.token,
  });

  // Method to create a User from a map (e.g., from JSON data)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      token: map['token'],
    );
  }

  // Method to convert a User to a map (e.g., for sending to the server)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
