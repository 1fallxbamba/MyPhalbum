import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo_main.png'),
                    radius: 50,
                    backgroundColor: Colors.transparent,
                  ),
                  Center(
                    child: Container(
                      height: 100,
                      width: 300,
                      alignment: Alignment.center,
                      child: Text("My Phalbum",
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
                height: 140,
                width: 530,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
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
                          hintText: "Mot de passe",
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
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text("Se connecter",
                        style: GoogleFonts.montserratAlternates(
                            color: Colors.white, fontSize: 20)),
                    onPressed: () {}),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      text: "Pas de compte ?  ",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 16),
                      children: [
                        TextSpan(
                            text: "S'inscrire",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {print('hey')}),
                      ],
                    ),
                  )))
            ],
          )),
    );
  }
}
