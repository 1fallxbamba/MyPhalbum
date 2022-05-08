import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

import 'package:myphalbum/models/api_response.dart';
import 'package:myphalbum/models/authentication_data.dart';

Future<APIResponse> createNewUser(RegistrationData newUserData) async {

  try {

    final response = await post(
        Uri.parse('${dotenv.env['API_BASE_URL']}auth/register'),
        headers: {'Content-type': 'application/json'},
        body: newUserData.toJSON()
    );

    return APIResponse.fromMap(jsonDecode(response.body));

  } catch(ex) {
    return APIResponse.networkError();
  }

}

Future<APIResponse> authenticate(LoginData loginData) async {

  try {

    final response = await post(
        Uri.parse('${dotenv.env['API_BASE_URL']}auth/login'),
        headers: {'Content-type': 'application/json'},
        body: loginData.toJSON()
    );

    return APIResponse.fromMap(jsonDecode(response.body));

  } catch(ex) {
    return APIResponse.networkError();
  }

}
