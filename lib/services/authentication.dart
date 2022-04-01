import 'package:http/http.dart';
import 'dart:convert';

// TODO: install package flutter_dotenv

Future<dynamic> registerUser(dynamic newUserData) async {

  try {

    Response resp = await post(
        Uri.parse('http://localhost:8000/api/auth/register'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(newUserData)
    );

    return resp;

  } catch(ex) {
    return null;
  }

}

Future<dynamic> authenticate(dynamic loginData) async {

  try {

    Response resp = await post(
        Uri.parse('http://localhost:8000/api/auth/login'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(loginData)
    );

    return resp;

  } catch(ex) {
    return null;
  }

}
