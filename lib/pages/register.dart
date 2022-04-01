import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myphalbum/services/authentication.dart';
import 'package:myphalbum/widgets/popup.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  bool isFormValid() {
    if (fullNameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void register() async {
    Map<String, dynamic> newUserData = {
      'fullName': fullNameController.text,
      'username': usernameController.text,
      'password': passwordController.text
    };

    if(isFormValid()) {
      dynamic _resp = await registerUser(newUserData);

      if (_resp == null) {
        showPopup(context, 'Oops...',
            'Nous rencontrons des soucis de connexion, veuillez vérifier votre connexion à internet.');
      } else {
        dynamic response = jsonDecode(_resp.body);
        if (response['Code'] == 'NUSR') {
          showPopup(
              context, 'Bienvenue sur My Phalbum !', response['Message']['fr']);
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          showPopup(context, 'Oops...', response['Message']['fr']);
        }
      }
    } else {
      showPopup(context, 'Oops...', 'Veuillez remplir tout le formulaire !');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/logo_main.png'),
                      radius: 50,
                      backgroundColor: Colors.transparent,
                    ),
                    Center(
                      child: Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                        child: Text('My Phalbum',
                            style: GoogleFonts.rockSalt(
                                fontSize: 34,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 210,
                  width: 530,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: fullNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nom complet',
                            contentPadding: EdgeInsets.all(20)),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        style: GoogleFonts.roboto(),
                      ),
                      const Divider(thickness: 1.5),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Nom d'utilisateur",
                            contentPadding: EdgeInsets.all(20)),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        style: GoogleFonts.roboto(),
                      ),
                      const Divider(thickness: 1.5),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Mot de passe',
                            contentPadding: const EdgeInsets.all(20),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            )),
                        obscureText: _isObscure,
                        style: GoogleFonts.roboto(),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 570,
                  height: 70,
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Text("S'inscrire",
                          style: GoogleFonts.montserratAlternates(
                              color: Colors.white, fontSize: 20)),
                      onPressed: () {
                        register();
                      }),
                ),
                Container(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        text: 'Déjà un compte ?  ',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'Se connecter',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.popAndPushNamed(
                                          context, '/login')
                                    }),
                        ],
                      ),
                    )))
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Make amazing albums...',
              style: GoogleFonts.montserratAlternates(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
