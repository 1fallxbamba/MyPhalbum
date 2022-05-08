import 'package:flutter/cupertino.dart';

import '../../../../services/authentication.dart';
import '../../../../services/storage.dart';

import 'package:myphalbum/models/authentication_data.dart';

import 'package:myphalbum/shared/widgets/popup.dart';

Future<void> logUserIn(BuildContext context, String username, String password,
    bool stayConnected) async {
  if (username.isEmpty || password.isEmpty) {
    showPopup(
        context, 'Oops...', 'Veuillez saisir vos informations de connexion !');
  } else {
    final loginData =
        LoginData.fromMap({'username': username, 'password': password});

    final response = await authenticate(loginData);

    if (response.code == 'NETERR') {
      showPopup(context, 'Oops...',
          'Nous rencontrons des soucis de connexion, veuillez vérifier votre connexion à internet.');
    } else {
      if (response.code == 'USA') {
        if (stayConnected) {
          saveLocalData('stayConnected', 'TRUE');
        }
        saveLocalData('userID', response.data['id']);
        Navigator.popAndPushNamed(context, '/home');
      } else {
        showPopup(context, 'Oops...', response.message['fr']);
      }
    }
  }
}
