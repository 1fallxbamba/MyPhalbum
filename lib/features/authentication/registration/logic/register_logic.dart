import 'package:flutter/cupertino.dart';

import 'package:myphalbum/services/authentication.dart';

import 'package:myphalbum/models/authentication_data.dart';

import 'package:myphalbum/shared/widgets/popup.dart';

Future<void> registerUser(BuildContext context, String fullName, String username,
    String password) async {
  if (fullName.isEmpty || username.isEmpty || password.isEmpty) {
    showPopup(context, 'Oops...', 'Veuillez remplir tout le formulaire !');
  } else {
    final newUserData = RegistrationData.fromMap(
        {'fullName': fullName, 'username': username, 'password': password});

    final response = await createNewUser(newUserData);

    if (response.code == 'NETERR') {
      showPopup(context, 'Oops...',
          'Nous rencontrons des soucis de connexion, veuillez vérifier votre connexion à internet.');
    } else {
      if (response.code == 'NUSR') {
        showPopup(context, 'Bienvenue sur My Phalbum !', response.message['fr'])
            .whenComplete(() => Navigator.popAndPushNamed(context, '/login'));
      } else {
        showPopup(context, 'Oops...', response.message['fr']);
      }
    }
  }
}
