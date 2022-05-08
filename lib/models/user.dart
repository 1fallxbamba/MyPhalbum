import 'dart:convert';

class User {
  final String? id;
  final String? fullName;
  final String? username;
  final String? picture;
  final DateTime? createdAt;

  User({this.id, this.fullName, this.username, this.picture, this.createdAt});

  List<Object?> get props => [id, fullName, username, picture, createdAt];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'username': username,
      'picture': picture,
      'createdAt': createdAt
    };
  }

  factory User.fromMap(Map<String, dynamic> userMap) {
    return User(
      id: userMap['id'],
      fullName: userMap['fullName'],
      username: userMap['username'],
      picture: userMap['picture'],
      createdAt: userMap['createdAt']
    );
  }

  String toJson() => jsonEncode(toMap());

}