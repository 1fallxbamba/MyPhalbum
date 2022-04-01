import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

Future<dynamic> registerUser(dynamic newUserData) async {

  try {

    Response resp = await post(
        Uri.parse('${dotenv.env['API_BASE_URL']}auth/register'),
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
        Uri.parse('${dotenv.env['API_BASE_URL']}auth/login'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(loginData)
    );

    return resp;

  } catch(ex) {
    return null;
  }

}
