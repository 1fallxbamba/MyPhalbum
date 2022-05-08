import 'dart:convert';

class LoginData {
  final String username;
  final String password;

  LoginData({required this.username, required this.password});

  factory LoginData.fromMap(Map<String, dynamic> loginDataMap) {
    return LoginData(
        username: loginDataMap['username'], password: loginDataMap['password']);
  }

  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password};
  }

  String toJSON() => jsonEncode(toMap());
}

class RegistrationData {
  final String fullName;
  final String username;
  final String password;

  RegistrationData(
      {required this.fullName, required this.username, required this.password});

  factory RegistrationData.fromMap(Map<String, dynamic> loginDataMap) {
    return RegistrationData(
        fullName: loginDataMap['fullName'],
        username: loginDataMap['username'],
        password: loginDataMap['password']);
  }

  Map<String, dynamic> toMap() {
    return {'fullName': fullName, 'username': username, 'password': password};
  }

  String toJSON() => jsonEncode(toMap());
}
