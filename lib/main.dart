import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myphalbum/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Phalbum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white60,
        body: const LoginPage(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Make amazing albums...",
                style: GoogleFonts.montserratAlternates(
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}
